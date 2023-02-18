import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:marutiseva/views/home_page.dart';
import 'package:marutiseva/views/about_page.dart';
import 'package:marutiseva/views/contact_page.dart';
import 'package:marutiseva/utils/constants.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart' as nav;

final GoRouter routerObject = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: <RouteBase>[
    GoRoute(
      name: routeHome,
      path: "/",
      // path: "/",
      builder: (context, state) => const HomeScreen(
        child: SizedBox(),
      ),
      routes: [
        GoRoute(
          name: "details",
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
        GoRoute(
          name: routeAbout,
          path: 'about',
          builder: (BuildContext context, GoRouterState state) {
            return AboutScreen(
              child: nav.NavigationBar(),
            );
          },
        ),
        GoRoute(
          name: routeContacts,
          path: 'contactus',
          builder: (BuildContext context, GoRouterState state) {
            return ContactScreen(
              child: nav.NavigationBar(),
            );
          },
        ),
        GoRoute(
          name: "settings",
          path: "settings/:name",
          builder: (context, state) {
            state.queryParams.forEach(
              (key, value) {
                print("$key:$value");
              },
            );
            return SettingsPage(
              name: state.params["name"]!,
            );
          },
        )
      ],
      // redirect: (context, state) {
      //   if (userIsNotLoggedIn) {
      //     return "/login";
      //   }
      //   return "/namedRoute";
      // },
    ),
  ],
);

class SettingsPage extends StatelessWidget {
  final String name;

  const SettingsPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(name),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}

/// The home screen

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
