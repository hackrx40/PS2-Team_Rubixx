const express = require("express");
const routers = express.Router();

routers.get("/", (req, res) => {
  res.json({
    message: "Get all article",
  });
});

routers.get("/:id", (req, res) => {
  res.json({
    message: "Get single article",
  });
});

routers.post("/", (req, res) => {
  res.json({
    message: "Post a article",
  });
});

routers.delete("/:id", (req, res) => {
  res.json({
    message: "delete a article",
  });
});

routers.patch("/:id", (req, res) => {
  res.json({
    message: "update a article",
  });
});

module.exports = routers;
