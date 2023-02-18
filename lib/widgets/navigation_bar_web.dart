import 'package:flutter/material.dart';

import 'package:marutiseva/widgets/nav_item.dart';
import 'package:marutiseva/utils/constants.dart';

class NavigationBar extends StatefulWidget {
  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  // int? index;
  int index = 0;
  @override
  void initState() {
    print("Getting initialised🔥🔥");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          NavigationItem(
            title: 'Home',
            selected: index == 0 ? true : false,
            routeName: routeHome,
            onHighlight: onHighlight,
          ),
          NavigationItem(
            title: 'About',
            selected: index == 1 ? true : false,
            routeName: routeAbout,
            onHighlight: onHighlight,
          ),
          NavigationItem(
            title: 'Contact',
            selected: index == 2 ? true : false,
            routeName: routeContacts,
            onHighlight: onHighlight,
          ),
        ],
      ),
    );
  }

  void onHighlight(String route) {
    switch (route) {
      case routeHome:
        changeHighlight(0);
        break;
      case routeAbout:
        changeHighlight(1);
        break;
      case routeContacts:
        changeHighlight(2);
        break;
    }
  }

  void changeHighlight(int newIndex) {
    print("Selection changed : ${newIndex}");
    setState(() {
      index = newIndex;
    });
    print("set state : ${index}");
  }
}
