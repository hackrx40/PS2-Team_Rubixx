const express = require("express");
const mongoose = require("mongoose");
const app = express();
const articleRoutes = require("./route/articleRoutes");
const generateArticle = require("./controllers/generateArticle");
const MongoClient = require("mongodb").MongoClient;
require("dotenv").config();
const { Mongo } = require("mongodb");
const axios = require("axios");
app.use(express.json());
app.use((req, res, next) => {
  console.log(req.path, req.method);
  next();
});

app.use("/api/articles", articleRoutes);

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
