import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatBotHelper {
  static Future<String> askQuestion(String ques) async {
    var url = Uri.parse('http://13.90.231.82:80/medibot/');
    var res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"query": ques}),
    );
    var data = jsonDecode(res.body);
    return data['response'];
  }
}
