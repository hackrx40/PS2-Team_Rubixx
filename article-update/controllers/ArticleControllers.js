const { default: mongoose } = require("mongoose");
const { findByIdAndDelete, update } = require("../models/Article");
const Article = require("../models/Article");
const generateArticle = require("./generateArticle");
// get all
const getAllArticle = async (req, res) => {
  try {
    const getArticles = await tokenData;
    res.status(200).json(getArticles);
    console.log(getArticles);
  } catch (error) {
    res.status(404).json({ error: error.message });
  }
};
// get single
const getArticle = async (req, res) => {
  const { id } = req.params;
  const Article = await Article.findById(id);

  if (!Article) {
    res.status(404).json({ error: "no such id present" });
  }
  res.status(200).json(Article);
};

// post

const generateArticle = async (req, res) => {
  generateArticle();
};

const createArticle = async (req, res) => {
  const { _id, title } = req.body;
  try {
    const Article = await Article.create({
      _id,
      title,
      content,
      Useful,
    });
    res.status(200).json(Article);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// delete

const deleteArticle = async (req, res) => {
  const { id } = req.params;
  const deleteArticle = await Article.findByIdAndDelete({ _id: id });
  if (!deleteArticle) {
    res.status(404).json({ message: "no such Article available" });
  }
  res.status(200).json(deleteArticle);
};
// update

const updateArticle = async (req, res) => {
  const { id } = req.params;
  const updateArticle = await Article.findOneAndUpdate(
    { _id: id },
    {
      ...req.body,
    }
  );
  if (!updateArticle) {
    res.status(404).json({ message: "no Article " });
  }

  res.status(200).json(updateArticle);
};

module.exports = {
  createArticle,
  getAllArticle,
  getArticle,
  deleteArticle,
  updateArticle,
  generateArticle,
};
