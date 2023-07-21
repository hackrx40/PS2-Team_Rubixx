import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mediserv/components/password_input.dart';
import 'package:mediserv/components/rounded_button.dart';
import 'package:mediserv/components/rounded_button_login.dart';
import 'package:mediserv/components/text_input.dart';
import 'package:mediserv/model/user_model.dart';
import 'package:mediserv/utils/auth_helper.dart';

import 'login_screen.dart';

class CreateNewAccount extends StatelessWidget {
  final nameController = TextEditingController();
  final userIdController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffAAE7E7),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.3,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesome.user,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Color(0xff5663ff),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          FontAwesome.arrow_up,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      controller: nameController,
                      icon: FontAwesome.user,
                      hint: 'User Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: userIdController,
                      icon: FontAwesome.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: phoneController,
                      icon: Icons.phone,
                      hint: 'Phone No',
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      controller: passController,
                      icon: FontAwesome.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButtonLoginPage(
                      buttonName: 'Register',
                      onPressed: () async {
                        await AuthHelper.register(
                            UserModel(
                                email: userIdController.text,
                                name: nameController.text,
                                phone: phoneController.text),
                            passController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 22, color: Colors.white, height: 1.5),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 22, color: Colors.white, height: 1.5),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
