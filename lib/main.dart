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
        Provider(create: (context){})
      ],
      child: Builder(builder: ((context){
        return MaterialApp.router(
          routerConfig: routes,
        );
      })),
    );

  }
}
