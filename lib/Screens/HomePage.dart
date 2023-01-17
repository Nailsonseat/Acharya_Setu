import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("This is home page"),
          ElevatedButton(
            onPressed: () => context.go('/settings'),
            child: Text("Settings"),
          ),
          ElevatedButton(
            onPressed: () => context.go('/browser'),
            child: Text("Browser"),
          ),
        ],
      )),
    );
  }
}
