import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class SignInOptions extends StatelessWidget {
  SignInOptions({Key? key, required this.animatedPageJump}) : super(key: key);

  final void Function(String) animatedPageJump;

  final List<String> options = ['Google', "Phone number", "Anonymous"];

  final List<String> iconPaths = [
    'lib/assets/icons/icons8-google.svg',
    'lib/assets/icons/icons8-phone.svg',
    'lib/assets/icons/icons8-account.svg'
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaler = MediaQuery.of(context).textScaleFactor;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 25),
            color: Colors.grey[100],
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsets.only(top: height / 95),
                child: Text('Sign In',
                    style: GoogleFonts.quicksand(
                      fontSize: /*(height + width) / 50*/ textScaler * 30,
                    )),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey[100],
          child: const Divider(
            color: Colors.black,
            thickness: .5,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.grey[100],
            child: ListView(
              padding: const EdgeInsets.only(top: 5),
              children: [
                for (int i = 0; i < options.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: height / 130),
                    child: ElevatedButton(
                      onPressed: () {
                        switch (i) {
                          case 0:
                            animatedPageJump("GOOGLE");
                            break;
                          case 1:
                            animatedPageJump("OTP1");
                            break;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: height / 60, bottom: height / 60),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.lightBlueAccent,
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SvgPicture.asset(
                              iconPaths[i],
                              height: height / 40,
                              width: width / 40,
                            ),
                          ),
                          Text(
                            options[i],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:textScaler*15 /*height > width ? (width) / 30 : (height + width) / 150*/,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
