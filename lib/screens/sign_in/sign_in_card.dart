import 'package:acharya_setu/screens/sign_in/sign_in_page_layouts/sign_in_method_layouts/sign_in_options.dart';
import 'package:flutter/material.dart';

class SignInCard extends StatelessWidget {
  SignInCard({Key? key}) : super(key: key);

  PageController controller=PageController();
  final List<Widget> _widgets=[SignInOptions(),Container(color: Colors.redAccent,)];

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 20,
      color: Colors.white,
      child: PageView(
        controller: controller,
        children:
          _widgets,
      ),
    );
  }
}
