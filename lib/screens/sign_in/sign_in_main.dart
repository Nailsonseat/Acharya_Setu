import 'package:acharya_setu/screens/sign_in/sign_in_page_layouts/sign_in_narrow_layout.dart';
import 'package:acharya_setu/screens/sign_in/sign_in_page_layouts/sign_in_wide_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/login_state_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginStateProvider>(context, listen: false)
          .checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStateProvider>(
      builder: (context, loginProvider, child) {
        if (loginProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          if (loginProvider.isLoggedIn) {
            Future.delayed(Duration.zero).then((_) {
              context.go('/home');
            });

            return const SizedBox();
          } else {
            return Scaffold(
              backgroundColor: Colors.teal,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return const SignInWide();
                  } else {
                    return const SignInNarrow();
                  }
                },
              ),
            );
          }
        }
      },
    );
  }
}
