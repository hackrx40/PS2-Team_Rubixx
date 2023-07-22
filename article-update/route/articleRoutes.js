const express = require("express");
const routers = express.Router();
const {
  getAllArticle,
  getArticle,
  createArticle,
  deleteArticle,
  updateArticle,
} = require("../controllers/ArticleControllers");
routers.get("/", (req, res) => {
  getAllArticle();
});

routers.get("/:id", (req, res) => {
  getArticle();
});

routers.post("/", (req, res) => {
  createArticle(req, res);
});

routers.delete("/:id", (req, res) => {
  deleteArticle(req, res);
});

routers.patch("/:id", (req, res) => {
  updateArticle(req, res);
});

module.exports = routers;
