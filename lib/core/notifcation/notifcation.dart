// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class NotifcationPage{
  Future<void> sendNotification({
    required String title,
    required String body,
    required String id,
  }) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    Dio dio = Dio();

    // var token = await getDeviceToken();
    // print('device token : $token');


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
      "to": id,
    };

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = 'key=AAAAENLZzqE:APA91bFiMUrsk5iKJcPJAOXjeKnYM0blUjSyAQUXZuib7zLIj-LrGcrBTSROaSG2ta7_cz_l3mTrJkyc3ZY9TEule3Q0LYUi8V_41pk3p-vafKePE-qw-tuhx_AtfZQh-Y6bJHdplf_b';

    try {
      final response = await dio.post(postUrl, data: data);
      if (response.statusCode == 200) {
        print('Request Sent To Driver');
      } else {
        print('notification sending failed');
      }
    } catch (e) {
      print('exception $e');
    }
  }
}