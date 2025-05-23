const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.sendMessageNotification = functions.firestore
    .document("chats/{chatId}/messages/{messageId}")
    .onCreate(async (snap, context) => {
      const messageData = snap.data();
      const chatId = context.params.chatId;
      // Get chat document to find participants
      const chatDoc = await admin
          .firestore()
          .collection("chats")
          .doc(chatId)
          .get();
      const participants = chatDoc.data().participants;
      const senderId = messageData.senderId;
      // Find recipient (not the sender)
      const recipientId = participants.find((id) => id !== senderId);
      // Get recipient's FCM token
      const userDoc = await admin
          .firestore()
          .collection("users")
          .doc(recipientId)
          .get();
      const fcmToken = userDoc.data().fcmToken;
      // Get sender's name
      const senderDoc = await admin
          .firestore()
          .collection("users")
          .doc(senderId)
          .get();
      const senderName = `${senderDoc.data().First_name} ` +
          `${senderDoc.data().Last_name}`;
      if (fcmToken) {
        const payload = {
          notification: {
            title: senderName,
            body: messageData.text,
          },
          data: {
            chatId: chatId,
          },
        };
        await admin.messaging().sendToDevice(fcmToken, payload);
      }
    });
