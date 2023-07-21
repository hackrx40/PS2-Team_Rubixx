import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mediserv/utils/notification_controller.dart';

class NotifContent {
  static Future<String> getNotification(int patient_id) async {
    var res = await http
        .post(
          Uri.parse('http://13.90.231.82/notification/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
            {"patient_id": patient_id},
          ),
        )
        .timeout(Duration(seconds: 20));
    return res.body;
  }
}
