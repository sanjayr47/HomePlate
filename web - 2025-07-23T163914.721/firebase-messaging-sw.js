importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js");

firebase.initializeApp({
     apiKey: 'AIzaSyDuT_VKzAa2_mN_-aDCfwe3sLhavUdsVuI',
     appId: '1:485022874761:web:768b68fc8d31ee89ff9a58',
     messagingSenderId: '485022874761',
     projectId: 'homeplate-vr',
     authDomain: 'homeplate-vr.firebaseapp.com',
     databaseURL: 'https://homeplate-vr-default-rtdb.asia-southeast1.firebasedatabase.app',
     storageBucket: 'homeplate-vr.firebasestorage.app',
     measurementId: 'G-HSELNM15NC',
});

const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
              };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});