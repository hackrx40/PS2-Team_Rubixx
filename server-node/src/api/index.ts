import { Router } from "express";
import { KycRouteHandler } from "./kyc/routes";
import { UserRouteHandler } from "./user/routes";

export default (): Router => {
  const app = Router();
  app.use("/user", UserRouteHandler());
  app.use("/kyc", KycRouteHandler());

  return app;
};
