import { NextFunction, Response, Request } from "express";
import errorClass from "../error";
import { isAdmin, verifyJwt } from "../services/jwtService";

export const authMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const authHeader = req.headers.authorization;
    const token = authHeader && authHeader.split(" ")[1];
    if (!token) throw Error("Invalid Request");
    else {
      const payload: any = await verifyJwt(token!);
      req.user = payload;
      next();
    }
  } catch (error) {
    console.error(error);
    next(new errorClass(res, "User not Authorized", 401));
  }
};
export const adminMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const authHeader = req.headers.authorization;
    const token = authHeader && authHeader.split(" ")[1];
    if (!token) throw Error("Invalid Request");
    else {
      const payload: any = await verifyJwt(token!);
      const admin = await isAdmin(token!);
      if (admin) {
        req.user = payload;
        next();
      }
    }
  } catch (error) {
    console.error(error);
    next(new errorClass(res, "User not Authorized", 401));
  }
};
