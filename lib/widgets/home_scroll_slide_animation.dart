import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/Locator.dart';
import '../utils/constants.dart';
import '../utils/index_incrementer.dart';
import 'navigation_bar_web.dart';

class HomeScrollSlideAnimation extends StatelessWidget {
  HomeScrollSlideAnimation({
    super.key,
    required this.pixels,
    required this.height,
    required this.toLeft,
    required this.imageUrl,
    required this.contentTitle,
    required this.contentText,
  });
  IndexIncrementNotifier dashboardValueNotifierq =
      getItLocator<IndexIncrementNotifier>();
// NavigationBarCustom navCustom=const NavigationBarCustom();
  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();

  final double pixels;
  final double height;
  final bool toLeft;
  final String imageUrl;
  final String contentTitle;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          toLeft
              ? Positioned(
                  left: -250.0,
                  child: Container(
                    height: 450.0,
                    width: 700.0,
                    decoration: BoxDecoration(
                      color: Colors.amber[400],
                      borderRadius: BorderRadius.circular(400.0),
                    ),
                  ),
                )
              : Positioned(
                  right: -250.0,
                  child: Container(
                    height: 450.0,
                    width: 700.0,
                    decoration: BoxDecoration(
                      color: Colors.amber[400],
                      borderRadius: BorderRadius.circular(400.0),
                    ),
                  ),
                ),
          toLeft
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: 20.0,
                  left: pixels >= 200 ? 100.0 : 0.0,
                  child: Container(
                    height: 400.0,
                    width: 700.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                    // child: Image.network(
                    //   'https://miro.medium.com/max/2400/0*qO2PFu6dr04R1O6P.png',
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                )
              : AnimatedPositioned(
                  // right: 50,
                  duration: const Duration(milliseconds: 500),
                  top: 20.0,
                  right: pixels >= 200 ? 100.0 : 0.0,
                  child: Container(
                    height: 400.0,
                    width: 700.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          toLeft
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  right: pixels >= 200 ? 100.0 : 0.0,
                  top: 30.0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: pixels >= 200 ? 1.0 : 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contentTitle,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 25.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          width: 280.0,
                          child: Text(
                            contentText,
                            // style: GoogleFonts.nunito(
                            //   fontWeight: FontWeight.w400,
                            //   color: Colors.black54,
                            //   fontSize: 14.0,
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            backgroundColor: Colors.grey[900],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50.0,
                              vertical: 20.0,
                            ),
                          ),
                          onPressed: () {
                            context.pushNamed(routeAbout);
                            // context.goNamed(routeName);
                            // context.go('/about');
                            dashboardValueNotifierq.value.tabIndex;
                            nvbar.onHighlight(routeAbout);
                          },
                          child: const Text(
                            'More...',
                            // style: GoogleFonts.nunito(
                            //   fontSize: 12.0,
                            //   fontWeight: FontWeight.w600,
                            //   color: Colors.white,
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  left: pixels >= 200 ? 100.0 : 0.0,
                  top: 30.0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: pixels >= 200 ? 1.0 : 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contentTitle,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 25.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          width: 280.0,
                          child: Text(
                            contentText,
                            // style: GoogleFonts.nunito(
                            //   fontWeight: FontWeight.w400,
                            //   color: Colors.black54,
                            //   fontSize: 14.0,
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            backgroundColor: Colors.grey[900],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50.0,
                              vertical: 20.0,
                            ),
                          ),
                          onPressed: () {
                            context.pushNamed(routeAbout);
                            // context.goNamed(routeName);
                            // context.go('/about');
                            dashboardValueNotifierq.value.tabIndex;
                            nvbar.onHighlight(routeAbout);
                          },
                          child: const Text(
                            'More...',
                            // style: GoogleFonts.nunito(
                            //   fontSize: 12.0,
                            //   fontWeight: FontWeight.w600,
                            //   color: Colors.white,
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
