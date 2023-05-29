import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:marutiseva/widgets/navigation_bar_web.dart';
import 'package:marutiseva/controllers/locator.dart';
import 'package:marutiseva/utils/constants.dart';

import '../widgets/home_scroll_slide_animation.dart';

const dummyText =
    'Manage your project, Organize your own workspace, keep statistics and collaborate with your teammates in one place';

class HomeScreen extends StatefulWidget {
  /// Constructs a [HomeScreen]
  // final Widget? child;
  // const HomeScreen({
  //   required this.child,
  //   Key? key,
  // }) : super(key: key);
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();
  late ScrollController _controller;
  double pixels = 0.0;
  int factor = 10;
  // Image homeImageSlideAnnimation =
  //     const Image(image: AssetImage('assets/images/slide1.jpg'));
  String homeImageSlideAnnimation = 'assets/images/slide1.jpg';
  String aboutUSImageSlideAnnimation =
      'assets/images/aboutus-side-animation-image.jpeg';
  // String footerImage = 'assets/images/marutiseva-footer-image.png';
  List<Image> images = const [
    Image(image: AssetImage('assets/images/slide1.jpg')),
    Image(image: AssetImage('assets/images/slide2.png')),
    Image(image: AssetImage('assets/images/slide3.png')),
    Image(image: AssetImage('assets/images/slide4.jpg')),
  ];
  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        pixels = _controller.position.pixels;
        // debugPrint(_controller.position.pixels as String?);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("TRACE: Building Home screen");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          nvbar,
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  SizedBox(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        // height: 400.0,
                        height: MediaQuery.of(context).size.height / 1.5,
                        enableInfiniteScroll: true,
                        reverse: false,
                        // enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      items: images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              // height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:
                                  const BoxDecoration(color: Colors.blueGrey),
                              child: Container(
                                child: i,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 20.0, height: 100.0),
                  HomeScrollSlideAnimation(
                    pixels: pixels,
                    pixelsLimit: 250,
                    height: 500,
                    toLeft: true,
                    contentText: ramalingamText,
                    contentTitle: "S.Ramalingam",
                    imageUrl: homeImageSlideAnnimation,
                  ),
                  HomeScrollSlideAnimation(
                    pixels: pixels,
                    pixelsLimit: 250,
                    height: 500,
                    toLeft: false,
                    contentText: dummyText,
                    contentTitle: "About Us",
                    imageUrl: aboutUSImageSlideAnnimation,
                  ),
                  HomeScrollSlideAnimation(
                    pixels: pixels,
                    pixelsLimit: 250,
                    height: 800,
                    toLeft: true,
                    contentText: ramalingamText,
                    contentTitle: "S.Ramalingam",
                    imageUrl: homeImageSlideAnnimation,
                  ),
                  Container(
                    height: 500,
                    padding: EdgeInsets.all(8.0 * factor),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 5.0 * factor),
                          blurRadius: 5.0 * factor,
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: <Widget>[
                    //     const SizedBox(width: 20.0, height: 100.0),
                    //     const Text(
                    //       'Be',
                    //       style: TextStyle(fontSize: 43.0),
                    //     ),
                    //     const SizedBox(width: 20.0, height: 100.0),
                    //     SizedBox(
                    //       height: 250.0,
                    //       width: 240.0,
                    //       child: DefaultTextStyle(
                    //         style: const TextStyle(
                    //           fontSize: 40.0,
                    //           fontFamily: 'Horizon',
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: AnimatedTextKit(
                    //             pause: const Duration(seconds: 2),
                    //             repeatForever: true,
                    //             animatedTexts: [
                    //               RotateAnimatedText('AWESOME'),
                    //               RotateAnimatedText('OPTIMISTIC'),
                    //               RotateAnimatedText('DIFFERENT'),
                    //               RotateAnimatedText('Focused'),
                    //             ],
                    //             onTap: () {
                    //               // print("Tap Event");
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
