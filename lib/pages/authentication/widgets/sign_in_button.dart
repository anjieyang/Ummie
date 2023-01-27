
import 'package:flutter/material.dart';
import 'package:ummie/config/config.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final Color color;

  const SignInButton({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 55,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: backgroundColor
        ),
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text, style: TextStyle(fontSize: 18, color: Colors.white),),
        ],
      ),
    );
  }
}
