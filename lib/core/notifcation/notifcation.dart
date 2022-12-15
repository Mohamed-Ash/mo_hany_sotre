// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class NotifcationPage{
  Future<void> sendNotification({
    required String title,
    required String body,
  }) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    Dio dio = Dio();

    // var token = await getDeviceToken();
    // debugPrint('device token : $token');


    final data = {
      "data": {
        "body": title,
        "title": body,
        "id": 'id',
      },
      "notification":{
        "title": title,
        "body": body
      },
      "to": '/topics/all',
    };

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = 'key=AAAAENLZzqE:APA91bFiMUrsk5iKJcPJAOXjeKnYM0blUjSyAQUXZuib7zLIj-LrGcrBTSROaSG2ta7_cz_l3mTrJkyc3ZY9TEule3Q0LYUi8V_41pk3p-vafKePE-qw-tuhx_AtfZQh-Y6bJHdplf_b';

    try {
      final response = await dio.post(postUrl, data: data);
      if (response.statusCode == 200) {
        debugPrint('Request Sent To Driver');
      } else {
        debugPrint('notification sending failed');
      }
    } catch (e) {
      debugPrint('exception $e');
    }
  }
}