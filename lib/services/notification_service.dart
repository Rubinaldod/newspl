import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordpress_app/models/constants.dart';
import 'package:wordpress_app/models/notification_model.dart';
import 'package:wordpress_app/pages/notifications.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import 'package:wordpress_app/utils/notification_dialog.dart';

class NotificationService {


  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final String subscriptionTopic = 'all';


  Future _handleIosNotificationPermissaion () async {
    NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }
  }





  Future initFirebasePushNotification(context) async {
    if (Platform.isIOS) {
      _handleIosNotificationPermissaion();
    }
    String? _token = await _fcm.getToken();
    print('User FCM Token : $_token');

    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    print('inittal message : $initialMessage');
    if (initialMessage != null) {
      await saveNotificationData(initialMessage).then((value) => nextScreen(context, Notifications()));
    }
    

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('onMessage');
      await saveNotificationData(message).then((value) => _handleOpenNotificationDialog(context, message));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await saveNotificationData(message).then((value) => nextScreen(context, Notifications()));
    });
  }



  Future _handleOpenNotificationDialog(context, RemoteMessage message) async {
    DateTime now = DateTime.now();
    String _timestamp = DateFormat('yyyyMMddHHmmss').format(now);
    NotificationModel notificationModel = NotificationModel(
        timestamp: _timestamp,
        date: message.sentTime,
        title: message.notification!.title,
        body: message.notification!.body);
    openNotificationDialog(context, notificationModel);
  }

  Future saveNotificationData(RemoteMessage message) async {
    final list = Hive.box(Constants.notificationTag);
    DateTime now = DateTime.now();
    String _timestamp = DateFormat('yyyyMMddHHmmss').format(now);
    Map<String, dynamic> _notificationData = {
      'timestamp': _timestamp,
      'date': message.sentTime,
      'title': message.notification!.title,
      'body': message.notification!.body
    };

    await list.put(_timestamp, _notificationData);
  }



  Future deleteNotificationData(key) async {
    final bookmarkedList = Hive.box(Constants.notificationTag);
    await bookmarkedList.delete(key);
  }



  Future deleteAllNotificationData() async {
    final bookmarkedList = Hive.box(Constants.notificationTag);
    await bookmarkedList.clear();
  }

  

  Future<bool> handleFcmSubscribtion() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool _subscription = sp.getBool('subscribed') ?? true;
    if (_subscription == true) {
      _fcm.subscribeToTopic(subscriptionTopic);
      print('subscribed');
    } else {
      _fcm.unsubscribeFromTopic(subscriptionTopic);
      print('unsubscribed');
    }

    return _subscription;
  }
}
