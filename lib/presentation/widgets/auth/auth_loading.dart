import 'package:flutter/material.dart';
import 'package:school_ai/core/bloc/auth_cubit/auth_login_cubit.dart';
import 'package:school_ai/old/constants.dart';
import 'package:school_ai/old/responsive.dart';
import 'package:school_ai/presentation/widgets/bg.dart';
import 'package:school_ai/presentation/widgets/custom_button.dart';
import 'package:school_ai/presentation/widgets/custom_textfeild.dart';
import 'package:school_ai/presentation/widgets/text_widget.dart';
import 'package:school_ai/presentation/widgets/wizard.dart';

// ignore: must_be_immutable
class AuthLoading extends StatelessWidget {
  AuthLoading({
    super.key,
    required this.width,
    required this.height,
    required this.userController,
    required this.passwordController,
    required this.authCubit,
  });
  double width;
  double height;
  final TextEditingController userController;
  final TextEditingController passwordController;
  final AuthLoginCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DesktopBG(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WSizedBox(wval: 0, hval: 0.03),
                  Row(
                    children: [
                      WSizedBox(wval: 0.01, hval: 0),
                      TextWidget(
                        text: '  School Ai',
                        textcolor: Colors.white,
                        textsize: MediaQuery.of(context).size.width * 0.02,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                  WSizedBox(wval: 0, hval: 0.12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WSizedBox(wval: 0.003, hval: 0),
                      Padding(
                        padding: EdgeInsets.all(
                          width * 0.05,
                        ),
                        child: Container(
                          width: width * 0.36,
                          height: height * 0.55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextField(
                                controller: userController,
                                borderradius: 10,
                                bordercolor: Colors.white,
                                onlyborder: Color.fromARGB(255, 129, 129, 131),
                                widh: 0.3,
                                height: 0.1,
                                icon: Icons.person,
                                iconColor: Colors.grey,
                                hinttext: 'user name',
                                hintColor: Colors.black45,
                                fontsize: 22,
                                obscureText: false,
                              ),
                              WSizedBox(wval: 0, hval: 0.02),
                              CustomTextField(
                                controller: passwordController,
                                borderradius: 10,
                                bordercolor: Colors.white,
                                onlyborder: Color.fromARGB(255, 129, 129, 131),
                                widh: 0.3,
                                height: 0.1,
                                icon: Icons.lock,
                                iconColor: Colors.grey,
                                hinttext: 'password',
                                hintColor: Colors.black45,
                                fontsize: 22,
                                obscureText: true,
                                onTap: () {
                                  debugPrint("pass");
                                },
                              ),
                              WSizedBox(wval: 0, hval: 0.04),
                              CustomButton(
                                buttontext: 'Login',
                                width: 0.33,
                                height: 0.12,
                                bordercolor: bgColor,
                                borderradius: 10,
                                fontsize: 22,
                                fontweight: FontWeight.bold,
                                fontcolor: Colors.white,
                                onPressed: () {
                                  print(userController.text);
                                  print(passwordController.text);
                                  authCubit.login(
                                    userController.text,
                                    passwordController.text,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (Responsive.isMobile(context)) MobileBG(),
              if (Responsive.isTablet(context)) MobileBG(),
            ],
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
        Center(
          child: Container(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
