import 'package:acharya_setu/providers/login_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/user_number_provider.dart';
import '../../../../../services/authentication/authenticate_OTP.dart';

class OTPVerificationPage extends StatelessWidget {
  final otpController = TextEditingController();
  final void Function(String) animatedPageJump;

  final OTPAuthenticate otpAuthenticate = OTPAuthenticate();

  OTPVerificationPage({super.key, required this.animatedPageJump});

  void _submitOTP(BuildContext context ,String otp)  {
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

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextFormField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              hintText: 'Enter OTP',
              contentPadding: const EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            onChanged: (value) => enteredOTP = value,
            onFieldSubmitted: (value) => _submitOTP(context, value),
          ),
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () => _submitOTP(context, enteredOTP),
          child: const Text('Submit'),
        ),
        TextButton(
          onPressed: () =>
              otpAuthenticate.signInOTP(phoneNumberProvider.phoneNumber),
          child: const Text('Resend OTP'),
        ),
      ],
    ));
  }
}
