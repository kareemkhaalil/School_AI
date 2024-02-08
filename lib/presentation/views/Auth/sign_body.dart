import 'package:flutter/material.dart';
import 'package:school_ai/old/responsive.dart';
import 'package:school_ai/presentation/widgets/bg.dart';
import 'package:school_ai/presentation/widgets/custom_button.dart';
import 'package:school_ai/presentation/widgets/custom_image.dart';
import 'package:school_ai/presentation/widgets/custom_textfeild.dart';
import 'package:school_ai/presentation/widgets/text_widget.dart';
import 'package:school_ai/presentation/widgets/wizard.dart';

class DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
            child: Container(
          color: const Color.fromARGB(255, 40, 42, 57),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Row(
                  children: [
                    WSizedBox(wval: 0.05, hval: 0),
                    TextWidget(
                      text: '  School Ai',
                      textcolor: Colors.white,
                      textsize: MediaQuery.of(context).size.width * 0.02,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
                WSizedBox(wval: 0, hval: 0.2),
                Row(
                  children: [
                    WSizedBox(wval: 0.05, hval: 0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Welcome Back',
                          textcolor: Colors.grey,
                          textsize: MediaQuery.of(context).size.width * 0.015,
                          fontWeight: FontWeight.normal,
                        ),
                        WSizedBox(wval: 0, hval: 0.02),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextWidget(
                              text: 'Login to your account',
                              textcolor: Colors.white,
                              textsize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              height: 10,
                              width: 10,
                            ),
                          ],
                        ),
                        WSizedBox(wval: 0, hval: 0.03),
                        WSizedBox(wval: 0, hval: 0.03),
                        const CustomTextField(
                            borderradius: 20,
                            bordercolor: Color.fromARGB(255, 50, 54, 69),
                            widh: 0.32,
                            height: 0.05,
                            icon: Icons.mail,
                            iconColor: Colors.grey,
                            hinttext: 'email',
                            hintColor: Colors.grey,
                            fontsize: 15,
                            obscureText: false),
                        WSizedBox(wval: 0, hval: 0.02),
                        const CustomTextField(
                            borderradius: 20,
                            bordercolor: Color.fromARGB(255, 50, 54, 69),
                            widh: 0.32,
                            height: 0.05,
                            icon: Icons.lock,
                            iconColor: Colors.grey,
                            hinttext: 'password',
                            hintColor: Colors.grey,
                            fontsize: 15,
                            obscureText: true),
                        WSizedBox(wval: 0, hval: 0.04),
                        CustomButton(
                          buttontext: 'Login',
                          width: 0.32,
                          height: 0.05,
                          bordercolor: Color.fromARGB(255, 29, 144, 244),
                          borderradius: 25,
                          fontsize: 12,
                          fontweight: FontWeight.bold,
                          fontcolor: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
        DesktopBG(),
        if (Responsive.isMobile(context)) MobileBG(),
        if (Responsive.isTablet(context)) MobileBG(),
      ],
    );
  }
}

class MobileBody extends StatelessWidget {
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
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 40, 42, 57), // لون بداية التدرج
                Color.fromARGB(255, 40, 42, 57)
                    .withOpacity(0.0), // لون النهاية مع شفافية 0
              ],
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WSizedBox(wval: 0.05, hval: 0.03),
                Align(
                  alignment: Alignment.topCenter,
                  child: TextWidget(
                    text: '  School Ai',
                    textcolor: Colors.white,
                    textsize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                WSizedBox(wval: 0.05, hval: 0.08),
                Container(
                  height: height * 0.4,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        const Color.fromARGB(255, 40, 42, 57).withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        WSizedBox(wval: 0.05, hval: 0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            WSizedBox(wval: 0, hval: 0.01),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget(
                                text: 'Welcome Back',
                                textcolor: Colors.grey,
                                textsize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            WSizedBox(wval: 0, hval: 0.007),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextWidget(
                                  text: 'Login to your account',
                                  textcolor: Colors.white,
                                  textsize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              ],
                            ),
                            WSizedBox(wval: 0, hval: 0.03),
                            WSizedBox(wval: 0, hval: 0.03),
                            const CustomTextField(
                                borderradius: 20,
                                bordercolor: Color.fromARGB(255, 50, 54, 69),
                                widh: 0.7,
                                height: 0.05,
                                icon: Icons.mail,
                                iconColor: Colors.grey,
                                hinttext: 'email',
                                hintColor: Colors.grey,
                                fontsize: 15,
                                obscureText: false),
                            WSizedBox(wval: 0, hval: 0.02),
                            const CustomTextField(
                                borderradius: 20,
                                bordercolor: Color.fromARGB(255, 50, 54, 69),
                                widh: 0.7,
                                height: 0.05,
                                icon: Icons.lock,
                                iconColor: Colors.grey,
                                hinttext: 'password',
                                hintColor: Colors.grey,
                                fontsize: 15,
                                obscureText: true),
                            WSizedBox(wval: 0, hval: 0.03),
                            CustomButton(
                              buttontext: 'Login',
                              width: 0.7,
                              height: 0.05,
                              bordercolor: Color.fromARGB(255, 29, 144, 244),
                              borderradius: 25,
                              fontsize: 12,
                              fontweight: FontWeight.bold,
                              fontcolor: Colors.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
