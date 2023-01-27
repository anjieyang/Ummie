
import 'package:flutter/material.dart';
import 'package:ummie/pages/authentication/widgets/sign_in_button.dart';

class PhoneSignInButton extends StatelessWidget {
  const PhoneSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("phone sign in");
      },
      child: SignInButton(text: "手机号登录", color: Colors.black),
    );
  }
}
