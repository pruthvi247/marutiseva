import 'package:flutter/material.dart';

import 'controllers/page_router.dart' as route;
import 'package:marutiseva/views/home_page.dart';
import 'package:marutiseva/controllers/Locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Maruthi Seva',
      routerConfig: route.routerObject,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // builder: (_, child) => HomeScreen(
      //   child: child,
      // ),
    );
  }
}
