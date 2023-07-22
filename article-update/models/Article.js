const axios = require("axios");
const mongoose = require("mongoose");

const schema = mongoose.Schema;
const shortid = require("shortid");

const ArticleSchema = new schema(
  {
    _id: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    content: {
      type: String,
      required: false,
    },
    url_link: {
      type: String,
      required: true,
    },
    body: {
      type: String,
      required: false,
    },
    notificationLayout: {
      type: String,
      required: true,
    },
  },
  { timestamps: true },
);

module.exports = mongoose.model("Article", ArticleSchema);
