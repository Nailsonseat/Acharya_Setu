import 'package:acharya_setu/providers/country_code_provider.dart';
import 'package:acharya_setu/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AcharyaSetuMain());
}

class AcharyaSetuMain extends StatelessWidget {
  const AcharyaSetuMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhoneNumberProvider()),
      ],
      child: Builder(builder: ((context) {
        return MaterialApp.router(
          routerConfig: routes,
        );
      })),
    );
  }
}
