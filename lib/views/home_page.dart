import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';

import 'package:marutiseva/controllers/Locator.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';

class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  // final Widget? child;
  // const HomeScreen({
  //   required this.child,
  //   Key? key,
  // }) : super(key: key);
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();

  @override
  Widget build(BuildContext context) {
    print("TRACE: Building Home screen");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          nvbar,
          ElevatedButton(
            // onPressed: () => context.go('/details'),
            onPressed: () => context.goNamed('details'),
            child: const Text('Go to the Details screen'),
          ),
        ],
      ),
    );
    ;
  }
}




// return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () => context.go('/details'),
//               child: const Text('Go to the Details screen'),
//             ),
//             const SizedBox(
//               height: 2,
//             ),
//             ElevatedButton(
//               onPressed: () => context.goNamed("settings", params: {
//                 "name": "codemagic"
//               }, queryParams: {
//                 "email": "example@gmail.com",
//                 "age": "25",
//                 "place": "India"
//               }),
//               child: const Text("Go to Settings page"),
//             )
//           ],
//         ),
//       ),
//     );
  
