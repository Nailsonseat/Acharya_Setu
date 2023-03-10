import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class OTPAuthenticate {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final logger = Logger('OTP Auth Logger');
  String? phoneNumber;
  late String _verificationId;

  Future signInOTP(String number) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        logger.warning('Failed to verify phone number: ${exception.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        logger.info('OTP sent to phone number: $phoneNumber');
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        logger.warning('OTP auto retrieval timeout for phone number: $phoneNumber');
      },
      timeout: const Duration(seconds: 30),
    );
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        logger.info('OTP verification successful for phone number: $phoneNumber');
        return true;
      } else {
        logger.warning('Failed to verify OTP for phone number: $phoneNumber');
        return false;
      }
    } catch (e) {
      logger.warning('Failed to verify OTP for phone number: $phoneNumber: ${e.toString()}');
      return false;
    }
  }
}
