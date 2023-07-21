require("dotenv").config();

process.env.NODE_ENV = process.env.NODE_ENV || "development";
console.log(process.env.ACCESSKEY_ID, process.env.SECRETACCESSKEY);

export default {
  port: process.env.PORT ? parseInt(process.env.PORT) : 8080,
  databaseURL: process.env.MONGODB_URI
    ? process.env.MONGODB_URI
    : "mongodb://localhost:27017",

  jwtSecret: process.env.JWT_SECRET,
  api: {
    prefix: "/api",
  },
  accessKeyId: process.env.ACCESSKEY_ID as string,
  secretAccessKey: process.env.SECRETACCESSKEY as string,
};
