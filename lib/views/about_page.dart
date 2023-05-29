import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:marutiseva/controllers/locator.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';

import '../utils/theme_selector.dart';
import '../widgets/bullet_list.dart';
import '../widgets/view_warapper.dart';
import 'package:marutiseva/utils/constants.dart';

class AboutScreen extends StatefulWidget {
  // final Widget? child;
  // const AboutScreen({
  //   Key? key,
  //   required this.child,
  // }) : super(key: key);
  const AboutScreen({
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

  @override
  Widget build(BuildContext context) {
    debugPrint("TRACE: Building about screen");
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
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Expanded(flex: 3, child: infoSection()),
          const Spacer(flex: 1),
          const Expanded(
              flex: 5,
              child: BulletList(
                strings: [
                  aboutUsBulletText1,
                  aboutUsBulletText6,
                  aboutUsBulletText2,
                  aboutUsBulletText3,
                  aboutUsBulletText4,
                  aboutUsBulletText5,
                  aboutUsBulletText6,
                  aboutUsBulletText7,
                  aboutUsBulletText8,
                  aboutUsBulletText4,
                ],
              )),
          const Spacer(flex: 1),
        ],
      ),
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
      // height: 600,
      child: SizedBox(
        width: screenWidth * 0.35,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: profilePicture(),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "S.Ramalingam",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w800,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            infoText()
          ],
        ),
      ),
    );
  }

  Widget profilePicture() {
    return SizedBox(
      child: SizedBox(
        height: getImageSize(),
        width: getImageSize(),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(getImageSize() / 2),
            child: Container(
              color: Colors.grey,
              child: Center(
                  child: Image.asset(
                      "assets/images/home-image-side-annimation.png")),
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
      ramalingamText,
      // ramalingamTextFull,
      overflow: TextOverflow.clip,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
