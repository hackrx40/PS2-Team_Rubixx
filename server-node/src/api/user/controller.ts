import { NextFunction, Response } from "express";
// import { WithId, Document } from "mongodb";
import { uuid } from "uuidv4";
import database from "../../loaders/database";
import errorClass from "../../shared/error";
import { compare, hash } from "bcrypt";
import { signJwt, verifyJwt } from "../../shared/services/jwtService";
import { UserRequest } from "./routes";

export const register = async (
  req: UserRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const password = req.body.password;

    // Check for exisiting users
    const databaseResponse = await (await database())
      .collection("user_data")
      .findOne({ email: req.body.email });
    if (databaseResponse !== null)
      throw Error("Existing user with the same email");

    const user_id = uuid().substring(2, 8).toUpperCase();
    const all = (await database()).collection("user_data");

    const len = all.countDocuments();
    // Adding user
    const newUser: any = {
      ...req.body,
      user_id,
      password: await hash(password, 14),
      id: len,
    };

    await (await database()).collection("user_data").insertOne({ ...newUser });

    delete newUser.password;

    return { success: true, user: newUser };
  } catch (err) {
    next(new errorClass(res, err.message, 501));
    return { success: false };
  }
};

export const userLogin = async (
  email: string,
  password: string,
  fcm: string,
  next: NextFunction,
  res: Response,
) => {
  try {
    const databaseResponse = await (await database())
      .collection("user_data")
      .findOne({ email });

    if (databaseResponse === null) throw Error("User does not exist");
    console.log(fcm);

    await (await database())
      .collection("user_data")
      .updateOne({ email }, { $set: { fcm } });
    if (!(await compare(password, databaseResponse.password)))
      throw Error("Invalid credentials");
    return await signJwt({ email });
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return;
  }
};

export const getUser = async (
  req: UserRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const token = req.headers.authorization?.split(" ")[1];
    console.log({ token });

    const { email } = await verifyJwt(token!);

    const user = await (await database())
      .collection("user_data")
      .findOne({ email });
    if (user) {
      delete user.password;
    }
    return user;
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return;
  }
};

export const updateUser = async (
  req: UserRequest,
  next: NextFunction,
  res: Response,
) => {
  try {
    const token = req.headers.authorization?.split(" ")[1];
    const { user_id } = await verifyJwt(token!);

    const updated: { interests?: any; documents?: any } = {};
    if (req.body.interests) updated.interests = req.body.interests;
    if (req.body.documents) updated.documents = req.body.documents;

    await (await database()).collection("user_data").findOneAndUpdate(
      { user_id },
      {
        $set: updated,
      },
    );

    return true;
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return false;
  }
};
