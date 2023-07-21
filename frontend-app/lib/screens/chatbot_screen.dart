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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(10),
        width: 0.949 * width,
        height: 500,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 50,
              left: 0,
              right: 0,
              child: Container(
                child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return Flexible(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: chats[index].isChatFromBot!
                              ? Color(0xFFEDEDED)
                              : Colors.white,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/chatbot.png',
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(child: Text(chats[index].text))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Container(
                  width: width,
                  height: 50,
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Chat with ai bot',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          setState(() {
                            chats.add(ChatbotModel(
                                text: _textController.text,
                                isChatFromBot: false,
                                dateTime: DateTime.now()));
                            ChatBotHelper.askQuestion(_textController.text)
                                .then((value) {
                              chats.add(ChatbotModel(
                                  text: value!,
                                  dateTime: DateTime.now(),
                                  isChatFromBot: true));
                              _textController.clear();
                            });
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
