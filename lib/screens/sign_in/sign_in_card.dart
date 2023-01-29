import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInCard extends StatelessWidget {
  SignInCard({Key? key}) : super(key: key);

  final List<String> options = ['Google', "Phone number", "Anonymous"];

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
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
              color: Colors.grey[100],
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: EdgeInsets.only(top:height/95),
                  child: Text('Sign In',
                      style: GoogleFonts.quicksand(
                        fontSize: (height+width)/50,
                      )),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.grey[100],
              child: ListView(
                padding: const EdgeInsets.only(top: 5),
                children: [
                  for (var option in options)
                    Padding(
                      padding: EdgeInsets.only(left:20,right:20,bottom: height/130),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding:EdgeInsets.only(top: height/60,bottom: height/60),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.lightBlueAccent,
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: SvgPicture.asset('lib/assets/icons8-google.svg',height: height/40,width: width/40,),
                              //child: Image.asset('lib/assets/icons8-google-48.png',height: 25,width: 25,fit: BoxFit.scaleDown,),
                            ),
                            Text(option,style: TextStyle(color: Colors.black,fontSize: height>width?(width)/30:(height+width)/150),),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
