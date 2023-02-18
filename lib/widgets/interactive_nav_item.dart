import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/html.dart' as html;
import 'package:go_router/go_router.dart';

import 'package:marutiseva/utils/constants.dart';

class InteractiveNavItem extends MouseRegion {
  static final appContainer =
      html.window.document.querySelectorAll('flt-glass-pane')[0];

  InteractiveNavItem(
      {super.key,
      Widget? child,
      required String text,
      required String routeName,
      required bool selected})
      : super(
          onHover: (PointerHoverEvent evt) {
            appContainer.style.cursor = 'pointer';
          },
          onExit: (PointerExitEvent evt) {
            appContainer.style.cursor = 'default';
          },
          child: InteractiveText(
            text: text,
            routeName: routeName,
            selected: selected,
          ),
        );
}

class InteractiveText extends StatefulWidget {
  final String text;
  final String routeName;
  final bool selected;

  const InteractiveText({
    super.key,
    required this.text,
    required this.routeName,
    required this.selected,
  });

  @override
  InteractiveTextState createState() => InteractiveTextState();
}

class InteractiveTextState extends State<InteractiveText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => _hovered(true),
      onExit: (_) => _hovered(false),
      child: Text(widget.text,
          style: _hovering
              ? kPageTitleStyle.copyWith(
                  color: Colors.indigo, decoration: TextDecoration.underline)
              : (widget.selected)
                  ? kPageTitleStyle.copyWith(color: Colors.red)
                  : kPageTitleStyle),
    );
  }

  _hovered(bool hovered) {
    setState(() {
      _hovering = hovered;
    });
  }
}
