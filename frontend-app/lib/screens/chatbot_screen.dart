import 'package:flutter/material.dart';
import 'package:mediserv/model/chatbot_model.dart';
import 'package:mediserv/utils/chatbot_helper.dart';

import '../components/homepage_smalbox.dart';
import '../components/search_bar.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _textController = TextEditingController();
  List<ChatbotModel> chats = [
    ChatbotModel(
      text: 'Hello mate! how may I help you today',
      dateTime: DateTime.now(),
      isChatFromBot: true,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 3,
      child: Container(
        width: 0.949 * width,
        height: 500,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 50,
              left: 0,
              right: 0,
              child: Container(),
            ),
            Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Chat with ai bot',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          setState(() async {
                            chats.add(ChatbotModel(
                                text: _textController.text,
                                dateTime: DateTime.now()));
                            var resp = await ChatBotHelper.askQuestion(
                                _textController.text);
                            chats.add(ChatbotModel(
                                text: resp!, dateTime: DateTime.now()));
                            _textController.clear();
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFAAE7E7), width: 1.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFAAE7E7), width: 1.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFAAE7E7), width: 1.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
