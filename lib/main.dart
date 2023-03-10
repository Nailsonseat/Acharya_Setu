import 'package:acharya_setu/providers/login_state_provider.dart';
import 'package:acharya_setu/providers/user_number_provider.dart';
import 'package:acharya_setu/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AcharyaSetuMain());
}

class AcharyaSetuMain extends StatelessWidget {
  const AcharyaSetuMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LoginStateProvider()),
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
