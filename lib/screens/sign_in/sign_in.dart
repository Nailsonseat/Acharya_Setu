
import 'package:acharya_setu/screens/sign_in/sign_in_layouts/sign_in_narrow_layout.dart';
import 'package:acharya_setu/screens/sign_in/sign_in_layouts/sign_in_wide_layout.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
   const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body:LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth>700){
            return const SignInWide();
          }
          else {
            return const SignInNarrow();
          }
        },
      ),
    );
  }
}
