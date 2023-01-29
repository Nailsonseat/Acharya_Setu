import 'package:acharya_setu/screens/sign_in/sign_in_card.dart';
import 'package:flutter/material.dart';

class SignInWide extends StatelessWidget {
  const SignInWide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
                Expanded(
                  flex: 4,
                  child: SignInCard(),
                ),
                Expanded(
                  flex: 5,
                  child: Container(),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      )),
    );
  }
}