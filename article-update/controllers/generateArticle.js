const axios = require("axios");
const a = ["prevention", "cause", "cure", "facts"];
const b = ["diabetes", "obesity", "cancer", "heart disease"];
const c = ["woman", "man"];
const generateArticle = async (minlen, maxlen, pid) => {
  try {
    const responses = await axios.post("http://13.90.231.82/notification/", {
      min_len: minlen,
      max_len: maxlen,
      patient_id: pid,
    });
    console.log(responses.data);
    return responses.data;
  } catch (error) {
    console.log(error);
  }
};

module.exports = generateArticle;
