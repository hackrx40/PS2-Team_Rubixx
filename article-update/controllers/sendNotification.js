const axios = require("axios");

const send = async (title, body, image, fcm) => {
  const res = axios.post(
    "https://fcm.googleapis.com/fcm/send",
    {
      token:
        "AAAAZY1QiFY:APA91bEkjfNw6ueaF5VgoiI185odnwcoPr0t4rGUOpMHj7pGcjdwhpHCJpyuTHKS3I5cX-LdaFeRanqEsPeDAHRRvVCBf8SUFcg2pgNSXLomiB7JHYgyVkrlY7DAws5tqReK-gPqZF6m",
      to: fcm,
      priority: "high",
      mutable_content: true,
      notification: {
        badge: 42,
        title,
        body,
      },
      data: {
        content: {
          id: 1,
          badge: 42,
          channelKey: "alerts",
          displayOnForeground: true,
          notificationLayout: "BigPicture",
          // bigPicture: image,
          showWhen: true,
          autoDismissible: true,
          privacy: "Public",
          payload: {
            secret: "Awesome Notifications Rocks!",
          },
        },
        actionButtons: [
          {
            key: "REDIRECT",
            label: "Redirect",
            autoDismissible: true,
          },
        ],
      },
    },
    {
      headers: {
        Authorization:
          "key=AAAAZY1QiFY:APA91bEkjfNw6ueaF5VgoiI185odnwcoPr0t4rGUOpMHj7pGcjdwhpHCJpyuTHKS3I5cX-LdaFeRanqEsPeDAHRRvVCBf8SUFcg2pgNSXLomiB7JHYgyVkrlY7DAws5tqReK-gPqZF6m",
      },
    },
  );
};

send(
  "hello",
  "nye",
  "",
  "eBuHeW5HTv24H9BALRH7jS:APA91bHnFzVvaB6yPYo494VwjPcliN7XQVj_6XXgAsJv-a8aUVpFE5D6yTAjkBr-MISdc3tvo7UxITqEa5wm5VnDBwLqHvQ2XNzl5kmF7vct3DyOGtfGzQRvPXdrcVzZzMdBeXd2ugwf",
);
module.exports = { send };
