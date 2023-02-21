import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:marutiseva/controllers/Locator.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';

import '../utils/theme_selector.dart';
import '../widgets/bullet_list.dart';
import '../widgets/view_warapper.dart';

class AboutScreen extends StatefulWidget {
  // final Widget? child;
  // const AboutScreen({
  //   Key? key,
  //   required this.child,
  // }) : super(key: key);
  AboutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();
  late double screenWidth;
  late double screenHeight;
  String loremIpsum =
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';

  @override
  Widget build(BuildContext context) {
    print("TRACE: Building about screen");
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        // direction: Axis.vertical,
        children: [
          nvbar,
          ViewWrapper(
            desktopView: desktopView(),
            mobileView: mobileView(),
          )
        ],
      ),
    );
  }

  Widget desktopView() {
    debugPrint('TRACE : Desktop view');
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            const Spacer(flex: 1),
            Expanded(
                flex: 3,
                child: BulletList(
                  strings: [loremIpsum, loremIpsum, loremIpsum, loremIpsum],
                )),
            const Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    debugPrint('TRACE : Mobile view');

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.05),
        infoText(),
        SizedBox(height: screenHeight * 0.05),
        SizedBox(
          height: screenHeight * 0.3,
          child: BulletList(
            strings: [loremIpsum, loremIpsum, loremIpsum, loremIpsum],
          ),
        ),
      ],
    );
  }

  Widget infoSection() {
    return SizedBox(
      height: 600,
      child: Container(
        width: screenWidth * 0.35,
        child: Column(
          children: [
            profilePicture(),
            SizedBox(height: screenHeight * 0.05),
            infoText()
          ],
        ),
      ),
    );
  }

  Widget profilePicture() {
    return SizedBox(
      child: Container(
        height: getImageSize(),
        width: getImageSize(),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(getImageSize() / 2),
            child: Container(
              color: Colors.grey,
              child: Center(child: Text('PLACEHOLDER IMAGE')),
            )),
      ),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return Text(
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      overflow: TextOverflow.clip,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
