import { NextFunction, Request, Response, Router } from "express";
import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import errorClass from "../../shared/error";
// import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import { requestValidation } from "../../shared/middlewares/validationMiddleware";
import { getUser, register, userLogin, updateUser } from "./controller";
import { createUserSchema, loginUserSchema } from "./schema";
import { upload } from "../../shared/middlewares/multerMiddleware";
const app = Router();

export interface UserRequest extends Request {
  body: any;
  file?: any;
}

export const UserRouteHandler = () => {
  app.post(
    "/register",
    requestValidation("body", createUserSchema),
    createUserHandler,
  );

  app.post(
    "/login",
    requestValidation("body", loginUserSchema),
    loginUserHandler,
  );

  app.get("/get-details", authMiddleware, getUserHandler);
  app.put("/update-interests", authMiddleware, updateUserHandler);

  app.post("/upload", authMiddleware, upload.single("template"), uploadHandler);

  return app;
};

const createUserHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const response = await register(req, next, res);
    if (response.success == true)
      res.json({ ...response, message: "User was added successfully" });
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

const loginUserHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const jwt = await userLogin(
      req.body.email,
      req.body.password,
      req.body.fcm,
      next,
      res,
    );
    if (jwt) {
      res.json({
        success: true,
        key: jwt,
        message: "User Logged In Successfully",
      });
    }
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

const getUserHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const user = await getUser(req, next, res);
    if (user) {
      res.json({
        success: true,
        user,
      });
    }
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

const updateUserHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const success = await updateUser(req, next, res);
    res.json({
      success,
    });
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};

const uploadHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    let url = req.file?.location;
    if (url) {
      url = url?.split("/");
      url[2] = url[2]?.split(".")?.slice(1)?.join(".");
      url = url?.join("/");
    } else {
      throw new Error("No image found");
    }

    res.json({ success: true, data: url });
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};
