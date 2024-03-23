import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_ai/core/bloc/form_validator/form_validator_cubit.dart';
import 'package:school_ai/core/bloc/student/cubit/student_cubit.dart';
import 'package:school_ai/core/utils/constants.dart';
import 'package:school_ai/core/utils/validation.dart/validator.dart';
import 'package:school_ai/old/constants.dart';
import 'package:school_ai/presentation/widgets/custom_button.dart';
import 'package:school_ai/presentation/widgets/custom_dropDown.dart';
import 'package:school_ai/presentation/widgets/form_text_input.dart';

class Students extends StatelessWidget with Validator {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final FormValidatorCubit _formValidatorCubit = FormValidatorCubit();

    final _formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          return BlocSelector<FormValidatorCubit, FormValidatorState,
                  AutovalidateMode>(
              bloc: _formValidatorCubit,
              selector: (state) => state.autovalidateMode,
              builder: (context, AutovalidateMode autovalidateMode) {
                return Form(
                  key: _formKey,
                  autovalidateMode: autovalidateMode,
                  child: Scaffold(
                    backgroundColor: bgColor,
                    body: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 12,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: wColor,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: height * 0.003,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                    height: height * 0.85,
                                    width: width,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
