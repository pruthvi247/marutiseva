import 'package:flutter/material.dart';

import 'package:marutiseva/controllers/locator.dart';
import 'package:marutiseva/widgets/navigation_bar_web.dart';
import 'package:marutiseva/utils/index_incrementer.dart';
import 'package:marutiseva/widgets/project_entry.dart';

import '../dataModels/project_model.dart';
import '../utils/theme_selector.dart';
import '../widgets/project_image.dart';
import '../widgets/view_warapper.dart';

class ServiceScreen extends StatefulWidget {
  // final Widget? child;
  // const ContactScreen({
  //   Key? key,
  //   required this.child,
  // }) : super(key: key);

  const ServiceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final NavigationBarCustom nvbar = getItLocator<NavigationBarCustom>();

  IndexIncrementNotifier dashboardValueNotifierq =
      getItLocator<IndexIncrementNotifier>();
  late double screenWidth;
  late double screenHeight;
  int selectedIndex = 0;
  List<Project> projects = [
    Project(
        title: 'Project 1',
        imageURL: 'assets/images/slide4.jpg',
        description:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.'),
    Project(
        title: 'Project 2',
        imageURL: 'assets/images/slide4.jpg',
        description:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?'),
    Project(
        title: 'Project 3',
        imageURL: 'assets/images/slide4.jpg',
        description:
            'Frac suàvitate mœdus férrî. La nourtiotre, à errœr près ne mils facîlis terme melîore de Je vidërèr port hir qûém né le aliments maison cùm èrrœr neç, démortene prodessêt, reur Pier alîenum êst. Ùt le taçimatés pro ceptes numquam men suble in comple de fenêtre pertinax. Nat insolens nommence. Éi ad nail appèterê èûm des mœdêratius quîdam. Id plâcèràt bands et dicunt diàm à per àd. Naient eà n’onvectioncroprésainte se at rèferrëntûr an erant cial. Fiancois nô omnèsqûe peur èos témpor d’un phaedrûm voin împedit de pro in œptiôn Aliqùid es. Et vîdé nam dèle ullùm es nours l’émon vis,')
  ];

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('assets/images/slide4.jpg'), context);
    precacheImage(const AssetImage('assets/images/slide4.jpg'), context);
    precacheImage(const AssetImage('assets/images/slide4.jpg'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("TRACE: Building contacts screen");
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
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
    double space = MediaQuery.of(context).size.height * 0.03;
    List<Widget> images =
        List.generate((projects.length * 1.5).ceil(), (index) {
      if (index.isEven) {
        return ProjectImage(
            project: projects[index ~/ 2],
            onPressed: () => updateIndex(index ~/ 2));
      } else {
        return SizedBox(height: space);
      }
    });
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.1),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: images,
                ),
                SizedBox(width: space),
                SizedBox(
                  height: screenHeight * 0.2 * 2 + space * 2,
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        alignment: selectedIndex == 0
                            ? Alignment.topCenter
                            : selectedIndex == 1
                                ? Alignment.center
                                : Alignment.bottomCenter,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          color: Colors.yellow,
                          width: screenWidth * 0.05,
                          height: 3,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: space),
                Expanded(child: ProjectEntry(project: projects[selectedIndex]))
              ],
            ))
      ],
    );
  }

  Widget mobileView() {
    List<Widget> projectList = List.generate(projects.length, (index) {
      return Column(
        children: [
          Text(
            projects[index].title,
            style: ThemeSelector.selectSubHeadline(context),
          ),
          SizedBox(height: screenHeight * 0.01),
          SizedBox(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                projects[index].imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            projects[index].description,
            style: ThemeSelector.selectBodyText(context),
          ),
          SizedBox(height: screenHeight * 0.1),
        ],
      );
    });
    return Column(children: projectList);
  }

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
