import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactScreen extends StatelessWidget {
  final Widget? child;
  const ContactScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("TRACE: Building contacts screen");
    return Scaffold(
      // appBar: AppBar(title: const Text('About Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          child ?? const SizedBox(),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('[contact]Go back to the Home screen'),
          ),
        ],
      ),
    );
  }
}
