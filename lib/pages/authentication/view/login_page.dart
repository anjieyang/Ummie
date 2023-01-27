
import 'package:flutter/material.dart';
import 'package:ummie/config/config.dart';
import 'package:ummie/pages/authentication/widgets/phone_sign_in_button.dart';
import 'package:ummie/pages/authentication/widgets/sign_in_button.dart';
import 'package:ummie/pages/authentication/widgets/wechat_sign_in_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 95),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/social.png', width: 250, height: 250,),
              const Divider(color: Colors.transparent,),
              Text("友间", style: TextStyle(fontSize: 30)),
              const Divider(color: Colors.transparent,),
              Text("最好的关系，是亲密有间。", style: TextStyle(fontSize: 18),),
              const Divider(color: Colors.transparent,),
              Padding(
                padding: EdgeInsets.only(top: 135),
                child: Column(
                  children: <Widget>[
                    PhoneSignInButton(),
                    WechatSignInButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
