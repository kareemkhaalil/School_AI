import 'package:flutter/material.dart';
import 'package:school_ai/core/utils/assets.dart';
import 'package:school_ai/core/utils/constants.dart';
import 'package:school_ai/old/responsive.dart';
import 'package:school_ai/presentation/widgets/custom_image.dart';

class DesktopBG extends StatelessWidget {
  DesktopBG({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Image.asset(
      AssestsData.authBG,
      alignment: Alignment.centerLeft,
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

// class MyPainter extends CustomPainter {
//   @override
//   void paint(
//     Canvas canvas,
//     Size size,
//   ) {
//     Paint paint = Paint()..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width * 0.5, 0);
//     path.lineTo(size.width * 0.4, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(MyPainter oldDelegate) => false;
// }
