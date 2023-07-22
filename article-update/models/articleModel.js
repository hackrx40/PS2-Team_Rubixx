const mongoose = require("mongoose");

const schema = mongoose.Schema;
const shortid = require("shortid");

const ArticleSchema = new schema(
  {
    _id: {
      type: String,
      default: shortid.generate,
    },
    title: {
      type: String,
      required: true,
    },
    content: {
      type: String,
      required: true,
    },
    useful: {
      type: Boolean,
      required: true,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Article", ArticleSchema);
