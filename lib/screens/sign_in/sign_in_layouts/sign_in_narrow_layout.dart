import 'package:flutter/material.dart';

class SignInNarrow extends StatelessWidget {
  const SignInNarrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
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
