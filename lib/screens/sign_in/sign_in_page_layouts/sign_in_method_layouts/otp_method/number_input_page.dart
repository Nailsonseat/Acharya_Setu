import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/user_number_provider.dart';

class NumberInputPage extends StatelessWidget {
  const NumberInputPage({Key? key, required this.animatedPageJump})
      : super(key: key);

  final void Function(String) animatedPageJump;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor;
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
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      animatedPageJump("OPTIONS");
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                        Text("  Back")
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "This number will be used for OTP verification",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: textScale * 15,
                  ),
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.grey[100],
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Consumer<PhoneNumberProvider>(
                        builder: (context, countryProvider, child) {
                      final selectedCountry = countryProvider.selectedCountry ??
                          countryProvider.countries[0];
                      return DropdownButton<Country>(
                        value: selectedCountry,
                        onChanged: (Country? country) {
                          if (country != null) {
                            countryProvider.setSelectedCountry(country);
                          }
                        },
                        items: countryProvider.countries
                            .map<DropdownMenuItem<Country>>((Country country) {
                          return DropdownMenuItem<Country>(
                            value: country,
                            child: Text('${country.flag} ${country.code}'),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  /*Expanded(
                    flex: 5,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'\d')),
                      ],
                      decoration: const InputDecoration(
                        labelText: "Enter your phone number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),*/
                  Consumer<PhoneNumberProvider>(
                    builder: (context, provider, child) {
                      return Expanded(
                        flex: 5,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            provider.setNumber(value);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'\d')),
                          ],
                          decoration: const InputDecoration(
                            labelText: "Enter your phone number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {animatedPageJump("OTP2");},
                child: Row(
                  children: const [Text("Continue")],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
