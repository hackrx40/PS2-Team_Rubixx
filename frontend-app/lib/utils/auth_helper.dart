import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class AuthHelper {
  Future<bool> register(UserModel userModel) async {
    var res = await http.post(
        Uri.parse('https://11d3-103-68-38-66.ngrok-free.app/api/user/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": "viraj.ag007+2@gmail.com",
          "password": "123456",
          "name": "Viraj Agarwal",
          "role": "patient",
          "phone": "7979783662"
        }));
    var data = jsonDecode(res.body);
    return data['success'];
  }
}
