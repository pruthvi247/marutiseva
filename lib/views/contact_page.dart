import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:marutiseva/controllers/Locator.dart';
import 'package:marutiseva/utils/constants.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';
import 'package:marutiseva/utils/index_incrementer.dart';
import 'package:marutiseva/widgets/nav_item.dart';

class ContactScreen extends StatelessWidget {
  // final Widget? child;
  // const ContactScreen({
  //   Key? key,
  //   required this.child,
  // }) : super(key: key);

  ContactScreen({
    Key? key,
  }) : super(key: key);
  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();
  IndexIncrementNotifier dashboardValueNotifierq =
      getItLocator<IndexIncrementNotifier>();
  @override
  Widget build(BuildContext context) {
    print("TRACE: Building contacts screen");
    return Scaffold(
      // body: Center(
      //   child: Text("About page...!"),
      // ),
      // appBar: AppBar(title: const Text('About Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // child ?? const SizedBox(),
          nvbar,
          ElevatedButton(
            onPressed: () {
              dashboardValueNotifierq.setTabIndex(0);
              return context.goNamed(routeHome);
            },
            child: const Text('[contact]Go back to the Home screen'),
          ),
        ],
      ),
    );
  }
}
