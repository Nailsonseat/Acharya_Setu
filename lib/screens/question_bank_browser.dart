import 'package:flutter/material.dart';


class QuestionBankBrowser extends StatefulWidget {
  const QuestionBankBrowser({Key? key}) : super(key: key);

  @override
  State<QuestionBankBrowser> createState() => _QuestionBankBrowserState();
}

class _QuestionBankBrowserState extends State<QuestionBankBrowser> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is the Bank Browser"),
      ),
    );
  }
}
