import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseHelper {
  static Future<void> initFirebaseMessaging() async {
    NotificationSettings _notificationSettings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (_notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print('User granted permission');
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        print('Token: $token');
        // Send token to your backend
      }
    } else {
      print('User denied permission');
    }
  }

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, dynamic> deviceData = {};
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        deviceData['deviceName'] = androidInfo.model;
        deviceData['deviceId'] = androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        deviceData['deviceName'] = iosInfo.model;
        deviceData['deviceId'] = iosInfo.identifierForVendor;
      }
    } catch (e) {
      print('Error getting device info: $e');
    }
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      deviceData['notificationToken'] = token;
    }

    // Function to update device data with new token
    Future<void> updateToken() async {
      String? newToken = await FirebaseMessaging.instance.getToken();
      if (newToken != null && newToken != deviceData['notificationToken']) {
        deviceData['notificationToken'] = newToken;
        // Send updated device data to your backend
      }
    }

    // Periodically check for token updates (adjust interval as needed)
    Timer.periodic(const Duration(minutes: 30), (_) => updateToken());

    return deviceData;
  }
}
