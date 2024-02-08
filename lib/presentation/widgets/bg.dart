import 'package:flutter/material.dart';
import 'package:school_ai/old/responsive.dart';
import 'package:school_ai/presentation/widgets/custom_image.dart';

class DesktopBG extends StatelessWidget {
  DesktopBG({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CustomImageWidget(
          height: 1,
          width: 0.5,
          imgpathNet:
              "https://images.unsplash.com/photo-1488903809927-48c9b4e43700?q=80&w=1960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        Container(
          height: height,
          width: width * 0.5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                const Color.fromARGB(255, 40, 42, 57), // لون بداية التدرج
                Color.fromARGB(255, 40, 42, 57)
                    .withOpacity(0.0), // لون النهاية مع شفافية 0
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MobileBG extends StatelessWidget {
  MobileBG({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CustomImageWidget(
          height: 1,
          width: 1,
          imgpathNet:
              "https://images.unsplash.com/photo-1488903809927-48c9b4e43700?q=80&w=1960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        ),
        Container(
          height: height,
          width: width * 1,
          color: Color.fromARGB(255, 40, 42, 57).withOpacity(
            0.3,
          ),
        ),
      ],
    );
  }
}
