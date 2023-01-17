import 'package:acharya_setu/Screens/HomePage.dart';
import 'package:acharya_setu/Screens/QuestionBankBrowser.dart';
import 'package:acharya_setu/Screens/Settings.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const Settings(),
        ),
        GoRoute(path: 'browser',
          builder: (context, state) => const QuestionBankBrowser(),
        ),
      ],
    ),
  ],
);
