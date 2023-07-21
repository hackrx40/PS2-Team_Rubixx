const axios = require("axios");

const generateArticle = async () => {
  try {
    const responses = await axios.post("http://13.90.231.82:80/medibot/", {
      body: {
        query: "I have a headache",
      },
    });

    const { data } = responses;
    console.log(data);
  } catch (error) {
    console.log(error);
  }
};

module.exports = generateArticle;
