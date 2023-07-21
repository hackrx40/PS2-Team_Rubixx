import { NextFunction, Request, Response, Router } from "express";
import errorClass from "../../shared/error";
// import { authMiddleware } from "../../shared/middlewares/authMiddleware";
import { requestValidation } from "../../shared/middlewares/validationMiddleware";
import { userLogin } from "./controller";

import { adminSchema } from "./schema";
const app = Router();

export interface UserRequest extends Request {
  body: any;
}
export const UserRouteHandler = () => {
  app.post("/login", requestValidation("body", adminSchema), loginAdminHandler);

  return app;
};

const loginAdminHandler = async (
  req: UserRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const jwt = await userLogin(req.body.email, req.body.password, next, res);
    if (jwt) {
      res.json({
        success: true,
        key: jwt,
        message: "Admin Logged In Successfully",
      });
    }
  } catch (error) {
    next(new errorClass(res, error.message, 401));
  }
};
