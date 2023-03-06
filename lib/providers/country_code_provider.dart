import 'package:flutter/material.dart';

class Country {
  final String code;
  final String name;
  final String flag;

  const Country({required this.code, required this.name, required this.flag});
}

class CountryCodeProvider extends ChangeNotifier {
  Country? _selectedCountry;

  Country? get selectedCountry => _selectedCountry;

  void setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }

  List<Country> countries = const [
    Country(code: '+1', name: 'United States', flag: '🇺🇸'),
    Country(code: '+44', name: 'United Kingdom', flag: '🇬🇧'),
    Country(code: '+33', name: 'France', flag: '🇫🇷'),
    Country(code: '+49', name: 'Germany', flag: '🇩🇪'),
    Country(code: '+39', name: 'Italy', flag: '🇮🇹'),
    Country(code: '+81', name: 'Japan', flag: '🇯🇵'),
    Country(code: '+86', name: 'China', flag: '🇨🇳'),
    Country(code: '+91', name: 'India', flag: '🇮🇳'),
    Country(code: '+55', name: 'Brazil', flag: '🇧🇷'),
    Country(code: '+7', name: 'Russia', flag: '🇷🇺'),
    Country(code: '+52', name: 'Mexico', flag: '🇲🇽'),
    Country(code: '+54', name: 'Argentina', flag: '🇦🇷'),
    Country(code: '+57', name: 'Colombia', flag: '🇨🇴'),
    Country(code: '+33', name: 'Canada', flag: '🇨🇦'),
    Country(code: '+41', name: 'Switzerland', flag: '🇨🇭'),
    Country(code: '+46', name: 'Sweden', flag: '🇸🇪'),
    Country(code: '+31', name: 'Netherlands', flag: '🇳🇱'),
    Country(code: '+47', name: 'Norway', flag: '🇳🇴'),
    Country(code: '+48', name: 'Poland', flag: '🇵🇱'),
    Country(code: '+34', name: 'Spain', flag: '🇪🇸'),
    Country(code: '+90', name: 'Turkey', flag: '🇹🇷'),
    Country(code: '+972', name: 'Israel', flag: '🇮🇱'),
    Country(code: '+20', name: 'Egypt', flag: '🇪🇬'),
    Country(code: '+27', name: 'South Africa', flag: '🇿🇦'),
  ];
// Add more country codes as needed
}
