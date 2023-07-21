import Database from "./database";
import Express from "./express";
import express from "express";

export default async ({ expressApp }: { expressApp: express.Application }) => {
  Express({ app: expressApp });
  console.log(`✌️ Express initalized sucessfully`);

  await Database();
  console.log(`✌️ Connection to database successful`);

  console.log("✅ All modules loaded!");
};
