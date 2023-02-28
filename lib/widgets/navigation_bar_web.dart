import 'package:flutter/material.dart';

import 'package:marutiseva/widgets/nav_item.dart';
import 'package:marutiseva/utils/constants.dart';
import 'package:marutiseva/controllers/locator.dart' as loc;
import 'package:marutiseva/utils/index_incrementer.dart';

class NavigationBarCustom extends StatefulWidget {
  NavigationBarCustom({super.key});
  IndexIncrementNotifier dashboardValueNotifierq =
      loc.getItLocator<IndexIncrementNotifier>();
  @override
  State<NavigationBarCustom> createState() => _NavigationBarCustomState();
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
      case routeServices:
        changeHighlight(3);
        break;
    }
  }

  void changeHighlight(int newIndex) {
    debugPrint("Selection changed : $newIndex");
    dashboardValueNotifierq.setTabIndex(newIndex);
  }
}

class _NavigationBarCustomState extends State<NavigationBarCustom> {
  // late IndexIncrementNotifier dashboardValueNotifierq;
  @override
  void initState() {
    debugPrint("Getting initialised🔥🔥");
    super.initState();
    // dashboardValueNotifier = IndexIncrementNotifier(
    //   value: IndexIncrement(tabIndex: ValueNotifier<int>(0)),
    // );
  }

  IndexIncrementNotifier dashboardValueNotifierq =
      loc.getItLocator<IndexIncrementNotifier>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          ValueListenableBuilder(
            valueListenable: dashboardValueNotifierq.value.tabIndex,
            builder: (BuildContext context, int value, Widget? child) {
              debugPrint(
                  'numberOfEspresso: ${dashboardValueNotifierq.value.tabIndex.value}');
              return NavigationItem(
                title: 'Home',
                selected: dashboardValueNotifierq.value.tabIndex.value == 0
                    ? true
                    : false,
                routeName: routeHome,
                onHighlight: widget.onHighlight,
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: dashboardValueNotifierq.value.tabIndex,
            builder: (BuildContext context, int value, Widget? child) {
              debugPrint(
                  'numberOfEspresso: ${dashboardValueNotifierq.value.tabIndex.value}');
              return NavigationItem(
                title: 'about',
                selected: dashboardValueNotifierq.value.tabIndex.value == 1
                    ? true
                    : false,
                routeName: routeAbout,
                onHighlight: widget.onHighlight,
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: dashboardValueNotifierq.value.tabIndex,
            builder: (BuildContext context, int value, Widget? child) {
              debugPrint(
                  'numberOfEspresso: ${dashboardValueNotifierq.value.tabIndex.value}');
              return NavigationItem(
                title: 'contact',
                selected: dashboardValueNotifierq.value.tabIndex.value == 2
                    ? true
                    : false,
                routeName: routeContacts,
                onHighlight: widget.onHighlight,
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: dashboardValueNotifierq.value.tabIndex,
            builder: (BuildContext context, int value, Widget? child) {
              debugPrint(
                  'cliced on ${dashboardValueNotifierq.value.tabIndex.value}');
              return NavigationItem(
                title: 'Services',
                selected: dashboardValueNotifierq.value.tabIndex.value == 3
                    ? true
                    : false,
                routeName: routeServices,
                onHighlight: widget.onHighlight,
              );
            },
          ),
        ],
      ),
    );
  }

  // void onHighlight(String route) {
  //   switch (route) {
  //     case routeHome:
  //       changeHighlight(0);
  //       break;
  //     case routeAbout:
  //       changeHighlight(1);
  //       break;
  //     case routeContacts:
  //       changeHighlight(2);
  //       break;
  //     case routeServices:
  //       changeHighlight(3);
  //       break;
  //   }
  // }

  // void changeHighlight(int newIndex) {
  //   debugPrint("Selection changed : $newIndex");
  //   dashboardValueNotifierq.setTabIndex(newIndex);
  // }
}
