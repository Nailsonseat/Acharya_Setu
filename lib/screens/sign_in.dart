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
      body:Center(
        child: Column(
          children: [
            Expanded(flex: 1,child: Container(),),
            Expanded(flex: 2,child: Row(
              children: [
                Expanded(flex: 1,child: Container(),),
                Expanded(flex: 10,child: Card(elevation: 20,child: Container(color: Colors.white,),),),
                Expanded(flex: 1,child: Container(),)
              ],
            ),),
            Expanded(flex: 1,child: Container(),),
          ],
        )
      ),
    );
  }
}
