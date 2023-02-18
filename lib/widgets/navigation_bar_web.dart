import 'package:flutter/material.dart';
import 'package:marutiseva/utils/index_incrementer.dart';

import 'package:marutiseva/widgets/nav_item.dart';
import 'package:marutiseva/utils/constants.dart';
import 'package:marutiseva/controllers/Locator.dart' as loc;
import 'package:marutiseva/utils/index_incrementer.dart';

class NavigationBarCustom extends StatefulWidget {
  @override
  State<NavigationBarCustom> createState() => _NavigationBarCustomState();
}

class _NavigationBarCustomState extends State<NavigationBarCustom> {
  // late IndexIncrementNotifier dashboardValueNotifierq;
  @override
  void initState() {
    print("Getting initialised🔥🔥");
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
                onHighlight: onHighlight,
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
                onHighlight: onHighlight,
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
                onHighlight: onHighlight,
              );
            },
          ),
          // NavigationItem(
          //   title: 'Home',
          //   selected: index1 == 0 ? true : false,
          //   routeName: routeHome,
          //   onHighlight: onHighlight,
          // ),
          // NavigationItem(
          //   title: 'About',
          //   selected: index1 == 1 ? true : false,
          //   routeName: routeAbout,
          //   onHighlight: onHighlight,
          // ),
          // NavigationItem(
          //   title: 'Contact',
          //   selected: index1 == 2 ? true : false,
          //   routeName: routeContacts,
          //   onHighlight: onHighlight,
          // ),
        ],
      ),
    );
  }

  void onHighlight(String route) {
    switch (route) {
      case routeHome:
        print("case home");
        changeHighlight(0);
        break;
      case routeAbout:
        print("case about");
        changeHighlight(1);
        break;
      case routeContacts:
        print("case contacts");
        changeHighlight(2);
        break;
    }
  }

  // void changeHighlight(int newIndex) {
  //   print("Selection changed : ${newIndex}");
  //   setState(() {
  //     index1 = newIndex;
  //   });
  // }
  void changeHighlight(int newIndex) {
    print("Selection changed : ${newIndex}");
    setState(() {
      // index1.value = newIndex;
      dashboardValueNotifierq.setTabIndex(newIndex);
      // notifyListeners();
    });
  }

  @override
  void dispose() {
    dashboardValueNotifierq.dispose();
    super.dispose();
  }
}
