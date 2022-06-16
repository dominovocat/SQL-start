require("dotenv").config();
const axios = require("axios");
const { Client } = require("pg");
const { migrate } = require("./migrate");
const { userQueries } = require("./users");

const client = new Client();


(async () => {
  await client.connect();

  // await userQueries(client);
  await migrate(client);

  await client.end();
  process.exit();
})();
// IIFE