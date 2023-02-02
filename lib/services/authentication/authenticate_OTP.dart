import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class OTPAuthenticate {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final logger = Logger('OTP Auth Logger');
  String? phoneNumber;

  Future signInOTP(String number) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException exception) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
