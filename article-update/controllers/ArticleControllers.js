const { default: mongoose } = require("mongoose");
const { findByIdAndDelete, update } = require("../models/Article");
const Article = require("../models/Article");
const generateArticle = require("./generateArticle");
const generateImage = require("./generateImage");
const axios = require("axios");
const { send } = require("./sendNotification");

const encodedParams = new URLSearchParams();
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

const getArticle = async (req, res) => {
  const { id } = req.params;
  const Article = await Article.findById(id);

  if (!Article) {
    res.status(404).json({ error: "no such id present" });
  }
  res.status(200).json(Article);
};

// post

const createArticle = async (req, res) => {
  const { min_len, max_len, patient_id } = req.body;
  const _id = patient_id;
  const tokenData = await generateArticle(min_len, max_len, patient_id);
  // console.log(tokenData.headline);
  // if (tokenData) {
  //   const imageUrl = await generateImage(tokenData.headline);
  //   return imageUrl;
  // }

  const newArticle = new Article({
    _id,
    title: tokenData.headline,
    content: tokenData.article,
    url_link:
      "https://pub-8b49af329fae499aa563997f5d4068a4.r2.dev/generations/a4cd9c34-afb2-4dd0-9dc5-3bb47e13a9a5-0.png",
    body: tokenData.article,
    notificationLayout: "BigPicture",
  });
  try {
    await newArticle.save();
    await send(tokenData.headline, tokenData.article);
    res.status(201).json(newArticle);
  } catch (error) {
    res.status(409).json({ error: error.message });
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
    },
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
