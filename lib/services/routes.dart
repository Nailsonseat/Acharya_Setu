import 'package:acharya_setu/screens/question_bank_browser.dart';
import 'package:acharya_setu/screens/settings.dart';
import 'package:acharya_setu/screens/sign_in.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInPage(),
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
