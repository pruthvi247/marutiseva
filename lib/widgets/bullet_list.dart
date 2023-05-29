import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marutiseva/widgets/bullet_points.dart';

class BulletList extends StatefulWidget {
  const BulletList({Key? key, required this.strings}) : super(key: key);
  final List<String> strings;

  @override
  // ignore: library_private_types_in_public_api
  _BulletListState createState() => _BulletListState();
}

class _BulletListState extends State<BulletList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    Timer(const Duration(milliseconds: 200),
        () => _animationController.forward());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.strings.length * 2, (index) {
            if (index.isEven) {
              return Flexible(flex: 2, child: Text(widget.strings[index]));
              // child: BulletPoint(
              //   text: widget.strings[index ~/ 2],
              //   animationController: _animationController,
              //   index: index ~/ 2,
              // ));
            } else {
              return const Spacer(flex: 1);
            }
          }),
        ),
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: List.generate(widget.strings.length * 2, (index) {
    //     if (index.isEven) {
    //       return Flexible(
    //           flex: 2,
    //           child: BulletPoint(
    //             text: widget.strings[index ~/ 2],
    //             animationController: _animationController,
    //             index: index ~/ 2,
    //           ));
    //     } else {
    //       return const Spacer(flex: 1);
    //     }
    //   }),
    // );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }