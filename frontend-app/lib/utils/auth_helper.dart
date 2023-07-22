import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<bool> register(UserModel userModel, String password) async {
    var res = await http.post(
        Uri.parse('https://11d3-103-68-38-66.ngrok-free.app/api/user/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": userModel.email,
          "password": password,
          "name": userModel.name,
          "role": "patient",
          "phone": userModel.phone
        }));
    var data = jsonDecode(res.body);
    return data['success'];
  }

  static login(String userId, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var fcm = prefs.get('fcm_token');
    var res = await http.post(
        Uri.parse('https://11d3-103-68-38-66.ngrok-free.app/api/user/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode({"user_id": userId, "password": password, "fcm": fcm}));
    var data = jsonDecode(res.body);
    if (data['success'] == true) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['key']);
    }
  }

  static Future<UserModel?> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    var res = await http.get(
        Uri.parse(
            'https://11d3-103-68-38-66.ngrok-free.app/api/user/get-details'),
        headers: {'Authorization': 'Bearer $token'});
    var data = jsonDecode(res.body);
    if (data['success'] == true) {
      UserModel userModel = UserModel.fromMap(data);
      return userModel;
    }
  }
}
