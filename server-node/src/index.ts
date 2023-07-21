import express from "express";
import config from "./config";
import Loaders from "./loaders";

async function startServer() {
  const app = express();

  await Loaders({ expressApp: app });
  app
    .listen(config.port, () => {
      console.log(`
      #####################################################
      🛡️  Server listening on port: http://localhost:${config.port} 🛡️
      #####################################################
    `);
    })
    .on("error", (err) => {
      console.error(err);
      process.exit(1);
    });
}
startServer();
