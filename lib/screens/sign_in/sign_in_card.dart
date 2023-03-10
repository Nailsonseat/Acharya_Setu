import 'package:acharya_setu/screens/sign_in/sign_in_page_layouts/sign_in_method_layouts/otp_method/number_input_page.dart';
import 'package:acharya_setu/screens/sign_in/sign_in_page_layouts/sign_in_method_layouts/otp_method/otp_input_page.dart';
import 'package:acharya_setu/screens/sign_in/sign_in_page_layouts/sign_in_method_layouts/sign_in_google.dart';
import 'package:acharya_setu/screens/sign_in/sign_in_page_layouts/sign_in_method_layouts/sign_in_options.dart';
import 'package:flutter/material.dart';

class SignInCard extends StatelessWidget {
  SignInCard({Key? key}) : super(key: key);

  final Map<String, int> pageStartIndex = {
    "OPTIONS":0,
    "GOOGLE": 1,
    "OTP1": 2,
    "OTP2":3
  };

  void animatedPageJump(String startWith) {
    controller.jumpToPage(pageStartIndex[startWith]!);
  }

  final PageController controller = PageController();
  late final  List<Widget> _widgets = [
    SignInOptions(animatedPageJump: animatedPageJump),
    const SignInGoogle(),
    NumberInputPage(animatedPageJump: animatedPageJump,),
    OTPVerificationPage(animatedPageJump: animatedPageJump,),
  ];



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.white,
      child: PageView(
        reverse: true,
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: _widgets,
      ),
    );
  }
}
