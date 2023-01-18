import 'package:acharya_setu/screens/home_page.dart';
import 'package:acharya_setu/screens/question_bank_browser.dart';
import 'package:acharya_setu/screens/settings.dart';
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
