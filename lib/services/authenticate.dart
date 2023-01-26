
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class Authenticate {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final logger=Logger('Auth logger');

  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      logger.info('Success');
      return user;
    }catch(error){
      logger.severe('Login Failed');
      return null;
    }
  }
}
