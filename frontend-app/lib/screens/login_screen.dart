import 'package:flutter/material.dart';
import 'package:mediserv/components/password_input.dart';
import 'package:mediserv/components/rounded_button_login.dart';
import 'package:mediserv/components/text_input.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xffAAE7E7),
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Mediserv',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Image.asset("assets/medico.png"),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    icon: FontAwesome.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    icon: FontAwesome.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontSize: 22, color: Colors.white, height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButtonLoginPage(
                    buttonName: 'Login',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                        fontSize: 22, color: Colors.white, height: 1.5),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
