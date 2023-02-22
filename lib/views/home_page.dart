import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

import 'package:marutiseva/widgets/navigation_bar_web.dart';
import 'package:marutiseva/controllers/Locator.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';

const dummyText =
    'Manage your project, Organize your own workspace, keep statistics and collaborate with your teammates in one place';

class HomeScreen extends StatefulWidget {
  /// Constructs a [HomeScreen]
  // final Widget? child;
  // const HomeScreen({
  //   required this.child,
  //   Key? key,
  // }) : super(key: key);
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();
  late ScrollController _controller;
  double pixels = 0.0;

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
        print(_controller.position.pixels);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("TRACE: Building Home screen");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              nvbar,
              SizedBox(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    enableInfiniteScroll: true,
                    reverse: false,
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
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Container(
                            child: i,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 100.0),
                  const Text(
                    'Be',
                    style: TextStyle(fontSize: 43.0),
                  ),
                  const SizedBox(width: 20.0, height: 100.0),
                  SizedBox(
                    height: 250.0,
                    width: 240.0,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Horizon',
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedTextKit(
                          pause: const Duration(seconds: 2),
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('AWESOME'),
                            RotateAnimatedText('OPTIMISTIC'),
                            RotateAnimatedText('DIFFERENT'),
                            RotateAnimatedText('Focused'),
                          ],
                          onTap: () {
                            // print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              home_scroll_slide_animation(
                pixels: pixels,
                height: 500,
                toLeft: true,
                contentText: dummyText,
                contentTitle: "Hello AI world!!!!",
                imageUrl:
                    'https://miro.medium.com/max/2400/0*qO2PFu6dr04R1O6P.png',
              ),
              home_scroll_slide_animation(
                pixels: pixels,
                height: 800,
                toLeft: false,
                contentText: dummyText,
                contentTitle: "Hello world !!!!",
                imageUrl:
                    'https://miro.medium.com/max/2400/0*qO2PFu6dr04R1O6P.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class home_scroll_slide_animation extends StatelessWidget {
  const home_scroll_slide_animation({
    super.key,
    required this.pixels,
    required this.height,
    required this.toLeft,
    required this.imageUrl,
    required this.contentTitle,
    required this.contentText,
  });

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
                  duration: Duration(milliseconds: 500),
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
                    child: Image.network(
                      'https://miro.medium.com/max/2400/0*qO2PFu6dr04R1O6P.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : AnimatedPositioned(
                  // right: 50,
                  duration: Duration(milliseconds: 500),
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
                  duration: Duration(milliseconds: 500),
                  right: pixels >= 200 ? 100.0 : 0.0,
                  top: 30.0,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: pixels >= 200 ? 1.0 : 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contentTitle,
                          // style: GoogleFonts.nunito(
                          //   fontWeight: FontWeight.w800,
                          //   fontSize: 25.0,
                          // ),
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
                          onPressed: () {},
                          child: const Text(
                            'Try for free',
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
                  duration: Duration(milliseconds: 500),
                  left: pixels >= 200 ? 100.0 : 0.0,
                  top: 30.0,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: pixels >= 200 ? 1.0 : 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contentTitle,
                          // style: GoogleFonts.nunito(
                          //   fontWeight: FontWeight.w800,
                          //   fontSize: 25.0,
                          // ),
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
                          onPressed: () {},
                          child: const Text(
                            'Try for free',
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
