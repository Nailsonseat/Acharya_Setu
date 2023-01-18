import 'package:acharya_setu/services/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AcharyaSetuMain());
}

class AcharyaSetuMain extends StatelessWidget {
  const AcharyaSetuMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
    );
  }
}
