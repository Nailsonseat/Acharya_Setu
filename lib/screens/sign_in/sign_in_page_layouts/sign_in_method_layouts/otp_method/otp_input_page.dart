import 'package:acharya_setu/providers/login_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/user_number_provider.dart';
import '../../../../../services/authentication/authenticate_OTP.dart';

class OTPVerificationPage extends StatelessWidget {
  final otpController = TextEditingController();
  final void Function(String) animatedPageJump;

  final OTPAuthenticate otpAuthenticate = OTPAuthenticate();

  OTPVerificationPage({super.key, required this.animatedPageJump});

  void _submitOTP(BuildContext context, String otp) {
    otpAuthenticate.verifyOTP(otp).then((result) {
      if (result) {
        Provider.of<LoginStateProvider>(context, listen: false).login();
        context.go("/home");
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Invalid OTP'),
            content: const Text('Please enter a valid OTP.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String enteredOTP = "";
    final PhoneNumberProvider phoneNumberProvider =
        Provider.of<PhoneNumberProvider>(context, listen: false);

    otpAuthenticate.signInOTP(phoneNumberProvider.phoneNumber);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScale = MediaQuery.of(context).textScaleFactor;

    final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

    final List<TextEditingController> textControllers =
        List.generate(6, (index) => TextEditingController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height / 2.04,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Text('Verification Code',
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
                        animatedPageJump("OTP1");
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                          SizedBox(width: 5,),
                          Text("Back")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                color: Colors.grey[100],
                child: Text(
                  "We have send the verification code to",
                  style: GoogleFonts.nunito(fontSize: textScale * 12),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                color: Colors.grey[100],
                child: Row(
                  children: [
                    Text(
                      "${phoneNumberProvider.phoneNumber.substring(0, 3)}*****${phoneNumberProvider.phoneNumber.substring(phoneNumberProvider.phoneNumber.length - 5)}",
                      style: GoogleFonts.nunito(fontSize: textScale * 12),
                    ),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                        onPressed: () => animatedPageJump("OTP1"),
                        child: Text(
                          "Change phone number?",
                          style: GoogleFonts.nunito(
                            fontSize: textScale * 12,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 58,
                            width: 48,
                            child: TextField(
                              controller: textControllers[0],
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              focusNode: focusNodes[0],
                              onTap: () {
                                textControllers[0].value = TextEditingValue(
                                  text: textControllers[0].text,
                                  selection: TextSelection.collapsed(
                                      offset: textControllers[0].text.length),
                                );
                              },
                              onChanged: (value) {
                                if (value.length == 1) {
                                  enteredOTP += value;
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  enteredOTP = enteredOTP.substring(
                                      0, enteredOTP.length - 1);
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 58,
                            width: 48,
                            child: TextField(
                              controller: textControllers[1],
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              focusNode: focusNodes[1],
                              onTap: () {
                                if (enteredOTP.length != 2) {
                                  FocusScope.of(context).requestFocus(
                                      focusNodes[enteredOTP.length]);
                                }
                                textControllers[1].value = TextEditingValue(
                                  text: textControllers[1].text,
                                  selection: TextSelection.collapsed(
                                      offset: textControllers[1].text.length),
                                );
                              },
                              onChanged: (value) {
                                if (value.length == 1) {
                                  enteredOTP += value;
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  enteredOTP = enteredOTP.substring(
                                      0, enteredOTP.length - 1);
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 58,
                            width: 48,
                            child: TextField(
                              controller: textControllers[2],
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              focusNode: focusNodes[2],
                              onTap: () {
                                if (enteredOTP.length != 3) {
                                  FocusScope.of(context).requestFocus(
                                      focusNodes[enteredOTP.length]);
                                }
                                textControllers[2].value = TextEditingValue(
                                  text: textControllers[2].text,
                                  selection: TextSelection.collapsed(
                                      offset: textControllers[2].text.length),
                                );
                              },
                              onChanged: (value) {
                                if (value.length == 1) {
                                  enteredOTP += value;
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  enteredOTP = enteredOTP.substring(
                                      0, enteredOTP.length - 1);
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 58,
                            width: 48,
                            child: TextField(
                              controller: textControllers[3],
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              focusNode: focusNodes[3],
                              onTap: () {
                                if (enteredOTP.length != 4) {
                                  FocusScope.of(context).requestFocus(
                                      focusNodes[enteredOTP.length]);
                                }
                                textControllers[3].value = TextEditingValue(
                                  text: textControllers[3].text,
                                  selection: TextSelection.collapsed(
                                      offset: textControllers[3].text.length),
                                );
                              },
                              onChanged: (value) {
                                if (value.length == 1) {
                                  enteredOTP += value;
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  enteredOTP = enteredOTP.substring(
                                      0, enteredOTP.length - 1);
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 58,
                            width: 48,
                            child: TextField(
                              controller: textControllers[4],
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              focusNode: focusNodes[4],
                              onTap: () {
                                if (enteredOTP.length != 5) {
                                  FocusScope.of(context).requestFocus(
                                      focusNodes[enteredOTP.length]);
                                }
                                textControllers[4].value = TextEditingValue(
                                  text: textControllers[4].text,
                                  selection: TextSelection.collapsed(
                                      offset: textControllers[4].text.length),
                                );
                              },
                              onChanged: (value) {
                                if (value.length == 1) {
                                  enteredOTP += value;
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  enteredOTP = enteredOTP.substring(
                                      0, enteredOTP.length - 1);
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 58,
                            width: 48,
                            child: TextField(
                              controller: textControllers[5],
                              style: Theme.of(context).textTheme.titleLarge,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              focusNode: focusNodes[5],
                              onTap: () {
                                if (enteredOTP.length != 6) {
                                  FocusScope.of(context).requestFocus(
                                      focusNodes[enteredOTP.length]);
                                }
                                textControllers[5].value = TextEditingValue(
                                  text: textControllers[5].text,
                                  selection: TextSelection.collapsed(
                                      offset: textControllers[5].text.length),
                                );
                              },
                              onChanged: (value) {
                                if (value.length == 1) {
                                  enteredOTP += value;
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  enteredOTP = enteredOTP.substring(
                                      0, enteredOTP.length - 1);
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextButton(
                          onPressed: () =>
                              otpAuthenticate.signInOTP(phoneNumberProvider.phoneNumber),
                          child: const Text('Resend OTP'),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextButton(
                          onPressed: () => _submitOTP(context, enteredOTP),
                          child: Row(
                            children: const [
                              Text("Submit"),
                            ],
                          ),
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
