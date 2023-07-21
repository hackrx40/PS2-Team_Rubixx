import { compare } from "bcrypt";
import { NextFunction } from "express";
import { signJwt } from "../../shared/services/jwtService";
import database from "../../loaders/database";
import errorClass from "../../shared/error";
import { Response } from "express";

export const userLogin = async (
  email: string,
  password: string,
  next: NextFunction,
  res: Response,
) => {
  try {
    const databaseResponse = await (await database())
      .collection("admins")
      .findOne({ email });

    if (databaseResponse === null) throw Error("User does not exist");
    if (!(await compare(password, databaseResponse.password)))
      throw Error("Invalid credentials");
    return await signJwt({ email, role: "admin" });
  } catch (error) {
    next(new errorClass(res, error.message, 501));
    return;
  }
};
