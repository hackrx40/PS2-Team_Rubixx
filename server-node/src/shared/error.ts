import { Response } from "express";

class errorClass extends Error {
  statusCode: number;
  constructor(res: Response, message: string, statusCode: number) {
    super(message);
    this.statusCode = statusCode;

    res.json({ success: false, message });
  }
}

export default errorClass;
