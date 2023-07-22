const send = async (title, body) => {
  const res = await fetch("https://fcm.googleapis.com/fcm/send", {
    method: "POST",
    body: {
      to: "d5ytrZSORZ-oz_UhgtRXDc:APA91bFpWdn-amHeaqJ_IOnpKZACe1IJcIKMBCSHmh1_vMJSsFmPxD2lzSFG_ULfD0XrbBh7-HE9B_TuifHohYTObEO8PXy9DE4f64-GI9t_fzd-nlEkgFCz_bCmyf6_w9t21w5lXeRV",
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
          bigPicture: "https://www.dw.com/image/49519617_303.jpg",
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
        Android: {
          content: {
            title: "Android! The eagle has landed!",
            payload: {
              android: "android custom content!",
            },
          },
        },
        iOS: {
          content: {
            title: "Jobs! The eagle has landed!",
            payload: {
              ios: "ios custom content!",
            },
          },
          actionButtons: [
            {
              key: "REDIRECT",
              label: "Redirect message",
              autoDismissible: true,
            },
            {
              key: "DISMISS",
              label: "Dismiss message",
              actionType: "DismissAction",
              isDangerousOption: true,
              autoDismissible: true,
            },
          ],
        },
      },
    },
  });

  const data = await res.json();
  return data;
};
module.exports = { send };
