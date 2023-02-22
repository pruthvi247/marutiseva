import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../dataModels/project_model.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({Key? key, required this.project, required this.onPressed})
      : super(key: key);
  final Project project;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.height * 0.2;
    return Theme(
      data: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: HoverCrossFadeWidget(
          firstChild: SizedBox(
            height: imageSize,
            width: imageSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                project.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          secondChild: Material(
            child: InkWell(
              onTap: onPressed,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: imageSize,
                  width: imageSize,
                  child: Center(
                    child: Text(
                      project.title,
                      style: const TextStyle(color: Colors.black),
                    ),
                  )),
            ),
          ),
          duration: const Duration(milliseconds: 200)),
    );
  }
}
