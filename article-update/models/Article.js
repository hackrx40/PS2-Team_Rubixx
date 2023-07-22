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
      required: true,
    },
    url_link: {
      type: String,
      required: true,
    },
    body: {
      type: String,
      required: true,
    },
    notificationLayout: {
      type: String,
      required: true,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Article", ArticleSchema);
