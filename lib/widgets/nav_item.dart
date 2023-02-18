import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;

  const NavigationItem(
      {super.key, required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(routeName);
      },
      // onTap: () {
      //   context.goNamed("settings", params: {
      //     "name": "codemagic"
      //   }, queryParams: {
      //     "email": "example@gmail.com",
      //     "age": "25",
      //     "place": "India"
      //   });
      // },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
