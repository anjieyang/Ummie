import 'package:flutter/material.dart';
import 'package:ummie/config/config.dart';
import 'package:ummie/pages/authentication/widgets/sign_in_button.dart';

class WechatSignInButton extends StatelessWidget {
  const WechatSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("wechat sign in");
      },
      child: SignInButton(text: "微信登录", color: themeColor),
    );
  }
}
