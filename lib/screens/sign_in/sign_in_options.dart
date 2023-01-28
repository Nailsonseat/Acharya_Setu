import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 25),
              color: Colors.blue,
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                child: Text(
                  'Sign In',
                  style: GoogleFonts.roboto(fontSize: 50,)
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 4,
            child: Placeholder(),
          )
        ],
      ),
    );
  }
}
