const axios = require("axios");
const demn = "woman and corona virus";

const generateImage = async (prompt) => {
  const response = await axios.post(
    "https://stablediffusionapi.com/api/v3/text2img",
    {
      key: "FafNvFptRs8TgidFUqlrNwfWyN6Km46MgK0UzLtyjoACfO0b2GFrc0TXU06S",
      prompt: `ultra realistic close up portrait ${prompt}`,
      negative_prompt: null,
      width: "904",
      height: "512",
      samples: "1",
      num_inference_steps: "20",
      safety_checker: "no",
      enhance_prompt: "yes",
      seed: null,
      guidance_scale: 7.5,
      multi_lingual: "no",
      panorama: "no",
      self_attention: "no",
      upscale: "no",
      embeddings_model: null,
      webhook: null,
      track_id: null,
    }
  );
  console.log(response.data.output[0]);
  return response.data.output[0];
};

module.exports = generateImage;
