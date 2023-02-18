import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:marutiseva/widgets/interactive_nav_item.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;
  final bool selected;
  final Function onHighlight;

  const NavigationItem({
    super.key,
    required this.title,
    required this.routeName,
    required this.selected,
    required this.onHighlight,
  });

  @override
  Widget build(BuildContext context) {
    print("Selcted in build ${title} : ${selected}");
    return GestureDetector(
      onTap: () {
        context.goNamed(routeName);
        // context.go('/about');
        onHighlight(routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: InteractiveNavItem(
          text: title,
          routeName: routeName,
          selected: selected,
        ),
      ),
    );
  }
}
