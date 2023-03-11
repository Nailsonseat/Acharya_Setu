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

    final PhoneNumberProvider phoneNumberProvider =
    Provider.of<PhoneNumberProvider>(context, listen: false);

    TextEditingController controller=TextEditingController();

    if (phoneNumberProvider.phoneNumber.length!=3){
      controller.text=phoneNumberProvider.phoneNumber.substring(3,phoneNumberProvider.phoneNumber.length);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height / 2.04,
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
              Container(
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
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Wrap(alignment: WrapAlignment.center, children: [
                        Text("This number will be used\n for OTP verification",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: textScale * 15,
                            )),
                      ]),
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
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: 60,
                            width: width * 30,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Consumer<PhoneNumberProvider>(
                                  builder: (context, countryProvider, child) {
                                final selectedCountry =
                                    countryProvider.selectedCountry ??
                                        countryProvider.countries[0];
                                return Material(
                                  color: Colors.transparent,
                                  child: DropdownButton<Country>(
                                    value: selectedCountry,
                                    onChanged: (Country? country) {
                                      if (country != null) {
                                        countryProvider
                                            .setSelectedCountry(country);
                                      }
                                    },
                                    underline: Container(),
                                    items: countryProvider.countries
                                        .map<DropdownMenuItem<Country>>(
                                            (Country country) {
                                      return DropdownMenuItem<Country>(
                                        value: country,
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(country.flag),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(country.code),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 4,
                          child: Consumer<PhoneNumberProvider>(
                            builder: (context, provider, child) {
                              return TextField(
                                controller: controller,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  provider.setNumber(value);
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'\d')),
                                ],
                                decoration: const InputDecoration(
                                  labelText: "Enter your phone number",
                                  border: OutlineInputBorder(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => animatedPageJump("OTP2"),
                        child: Row(
                          children: const [
                            Text("Continue"),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios, size: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
