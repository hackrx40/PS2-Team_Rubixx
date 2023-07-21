const express = require("express");
const mongoose = require("mongoose");
const app = express();

require("dotenv").config();

mongoose
  .connect(process.env.URI)
  .then(() => {
    app.listen(process.env.PORT, () => {
      console.log("server started", process.env.PORT);
    });
  })
  .catch((error) => {
    console.error(error);
  });
