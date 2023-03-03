import 'package:flutter/foundation.dart';

class PhoneNumberProvider with ChangeNotifier{
  String _mobileNumber='';
  String _countryCode='+91';

  String get mobileNumber =>_mobileNumber;
  String get countryCode =>_countryCode;

  void setNumber(String number){
    _mobileNumber=number;
  }

  void setCountryCode(String code){
    _countryCode=code;
    notifyListeners();
  }
}