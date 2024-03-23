import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_ai/core/bloc/auth_cubit/auth_login_cubit.dart';
import 'package:school_ai/core/bloc/form_validator/form_validator_cubit.dart';
import 'package:school_ai/core/utils/constants.dart';
import 'package:school_ai/core/utils/service_locator.dart';
import 'package:school_ai/core/utils/validation.dart/validator.dart';
import 'package:school_ai/data/repositories/auth_repo/login_repo_impl.dart';
import 'package:school_ai/old/constants.dart';
import 'package:school_ai/old/responsive.dart';
import 'package:school_ai/presentation/widgets/auth/auth_loading.dart';
import 'package:school_ai/presentation/widgets/bg.dart';
import 'package:school_ai/presentation/widgets/custom_button.dart';
import 'package:school_ai/presentation/widgets/custom_textfeild.dart';
import 'package:school_ai/presentation/widgets/text_widget.dart';
import 'package:school_ai/presentation/widgets/wizard.dart';

class DesktopBody extends StatelessWidget with Validator {
  final FormValidatorCubit _formValidatorCubit = FormValidatorCubit();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final userController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthLoginCubit(
        getIt.get<LoginRepoImpl>(),
      ),
      child: BlocListener<AuthLoginCubit, AuthLoginState>(
        listener: (context, state) {
          var authCubit = context.read<AuthLoginCubit>();

          if (state is AuthLoginSuccess) {
            authCubit.goToAddStudent(context);
          } else if (state is AuthLoginFailuer) {
            AlertDialog(
              title: Text(
                'خطأ في تسجيل الدخول ',
                style: TextStyle(
                    color: bgColor,
                    fontFamily: cairo,
                    fontSize: 22,
                    fontWeight: FontWeight.w900),
              ),
              content: Text(
                state.message,
                style: TextStyle(
                  color: bgColor,
                  fontFamily: cairo,
                  fontSize: 18,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => authCubit.refresh(),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: bgColor.withOpacity(
                        0.7,
                      ),
                      fontFamily: cairo,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              shadowColor: Colors.black,
              backgroundColor: Colors.white,
            );
          }
        },
        child: BlocBuilder<AuthLoginCubit, AuthLoginState>(
          builder: (context, state) {
            var authCubit = context.read<AuthLoginCubit>();

            if (state is AuthLoginLoading) {
              return AuthLoading(
                width: width,
                height: height,
                userController: userController,
                passwordController: passwordController,
                authCubit: authCubit,
              );
            } else if (state is AuthLoginSuccess) {
              return authCubit.goToAddStudent(context);
            } else if (state is AuthLoginFailuer) {
              return AlertDialog(
                title: Text(
                  'خطأ في تسجيل الدخول ',
                  style: TextStyle(
                      color: bgColor,
                      fontFamily: cairo,
                      fontSize: 22,
                      fontWeight: FontWeight.w900),
                ),
                content: Text(
                  state.message,
                  style: TextStyle(
                    color: bgColor,
                    fontFamily: cairo,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => authCubit.refresh(),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: bgColor.withOpacity(
                          0.7,
                        ),
                        fontFamily: cairo,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                shadowColor: Colors.black,
                backgroundColor: Colors.white,
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DesktopBG(),
                  BlocSelector<FormValidatorCubit, FormValidatorState,
                      AutovalidateMode>(
                    bloc: _formValidatorCubit,
                    selector: (state) => state.autovalidateMode,
                    builder: (context, AutovalidateMode autovalidateMode) {
                      return Form(
                        key: _formKey,
                        autovalidateMode: autovalidateMode,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WSizedBox(wval: 0, hval: 0.03),
                            Row(
                              children: [
                                WSizedBox(wval: 0.01, hval: 0),
                                TextWidget(
                                  text: '  School Ai',
                                  textcolor: Colors.white,
                                  textsize:
                                      MediaQuery.of(context).size.width * 0.02,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomTextField(
                                          controller: userController,
                                          borderradius: 10,
                                          bordercolor: Colors.white,
                                          onlyborder: Color.fromARGB(
                                              255, 129, 129, 131),
                                          widh: 0.3,
                                          height: 0.1,
                                          icon: Icons.person,
                                          iconColor: Colors.grey,
                                          hinttext: 'user name',
                                          hintColor: Colors.black45,
                                          fontsize: 22,
                                          obscureText: false,
                                          validator: validateName,
                                          onChanged:
                                              _formValidatorCubit.updateName,
                                        ),
                                        WSizedBox(wval: 0, hval: 0.02),
                                        CustomTextField(
                                          controller: passwordController,
                                          borderradius: 10,
                                          bordercolor: Colors.white,
                                          onlyborder: Color.fromARGB(
                                              255, 129, 129, 131),
                                          widh: 0.3,
                                          height: 0.1,
                                          icon: Icons.lock,
                                          iconColor: Colors.grey,
                                          hinttext: 'password',
                                          hintColor: Colors.black45,
                                          fontsize: 22,
                                          obscureText: true,
                                          onTap: () {
                                            print("pass");
                                          },
                                          validator: validatePassword,
                                          onChanged: _formValidatorCubit
                                              .updatePassword,
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
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print(userController.text);
                                              print(passwordController.text);
                                              print(state);

                                              authCubit.login(
                                                userController.text,
                                                passwordController.text,
                                                context,
                                              );
                                            } else {
                                              _formValidatorCubit
                                                  .updateAutovalidateMode(
                                                      AutovalidateMode.always);
                                            }
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
                      );
                    },
                  ),
                  if (Responsive.isMobile(context)) MobileBG(),
                  if (Responsive.isTablet(context)) MobileBG(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
