import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:marutiseva/controllers/Locator.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';

class AboutScreen extends StatelessWidget {
  // final Widget? child;
  // const AboutScreen({
  //   Key? key,
  //   required this.child,
  // }) : super(key: key);
  AboutScreen({
    Key? key,
  }) : super(key: key);

  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();
  @override
  Widget build(BuildContext context) {
    print("TRACE: Building about screen");
    return Scaffold(
      // appBar: AppBar(title: const Text('About Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          nvbar,
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('[About]Go back to the Home screen'),
          ),
        ],
      ),
    );
  }
}
