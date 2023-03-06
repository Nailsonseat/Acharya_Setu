import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../providers/country_code_provider.dart';

class NumberInputPage extends StatelessWidget {
  const NumberInputPage({Key? key, required this.animatedPageJump})
      : super(key: key);

  final void Function(String) animatedPageJump;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale=MediaQuery.of(context).textScaleFactor;
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
                child: Text('Enter Number',
                    style: GoogleFonts.quicksand(
                      fontSize: (height + width) / 50,
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
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      animatedPageJump("OPTIONS");
                    },
                  ),
                  const Text(
                    "Back",
                    style: TextStyle(fontSize: 18,color: Colors.blueAccent),
                  )
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              child:  Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("This number will be used for OTP verification",
                  textAlign:TextAlign.center,style: TextStyle(
                  fontSize: textScale*16,
                ),),
              ),
            )),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey[100],
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Consumer<CountryCodeProvider>(
                        builder: (context, provider, child) {
                      final selectedCountry =
                          provider.selectedCountry ?? provider.countries[0];
                      return DropdownButton<Country>(
                        value: selectedCountry,
                        onChanged: (Country? country) {
                          if (country != null) {
                            provider.setSelectedCountry(country);
                          }
                        },
                        items: provider.countries
                            .map<DropdownMenuItem<Country>>((Country country) {
                          return DropdownMenuItem<Country>(
                            value: country,
                            child: Text('${country.flag} ${country.code}'),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  const Expanded(
                    flex: 5,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter your phone number",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
