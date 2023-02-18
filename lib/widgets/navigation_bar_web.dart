import 'package:flutter/material.dart';

import 'package:marutiseva/widgets/nav_item.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: const [
          NavigationItem(
            title: 'Home',
            routeName: "home",
          ),
          NavigationItem(
            title: 'About',
            routeName: "about",
          ),
          NavigationItem(title: 'Contact', routeName: "contact"),
        ],
      ),
    );
  }
}
