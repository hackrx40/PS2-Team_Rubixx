import 'package:flutter/material.dart';

class RoundedButtonLoginPage extends StatelessWidget {
  const RoundedButtonLoginPage({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);
  final void Function() onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xff38D0BF),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
        ),
      ),
    );
  }
}
