import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
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
  List<Image> images = const [
    Image(image: AssetImage('assets/images/slide1.jpg')),
    Image(image: AssetImage('assets/images/slide2.png')),
    Image(image: AssetImage('assets/images/slide3.png')),
    Image(image: AssetImage('assets/images/slide4.jpg')),
  ];
  @override
  Widget build(BuildContext context) {
    print("TRACE: Building Home screen");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
        ],
      ),
    );
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
