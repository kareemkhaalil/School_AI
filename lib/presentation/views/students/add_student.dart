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

class AddStudent extends StatelessWidget with Validator {
  const AddStudent({super.key});

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
          var cubit = context.read<StudentCubit>();
          var idNumTextController = cubit.nationalIdController;
          var dateOfBirth = cubit.dateOfBirthController;
          return BlocSelector<FormValidatorCubit, FormValidatorState,
                  AutovalidateMode>(
              bloc: _formValidatorCubit,
              selector: (state) => state.autovalidateMode,
              builder: (context, AutovalidateMode autovalidateMode) {
                return Form(
                  key: _formKey,
                  autovalidateMode: autovalidateMode,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'بيانات الطالب',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: cairo,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            color: bgColor.withOpacity(0.4),
                            alignment: Alignment.center,
                            height: height * 0.005,
                            width: width * 0.4,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // photo
                              Row(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: width * 0.13,
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: cubit.image == null ||
                                              cubit.image == ""
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 60,
                                                  color: Colors.grey[600],
                                                ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Text(
                                                  'صورة الطالب',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: cairo,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.memory(
                                                cubit.image,
                                              ),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        radius: 20,
                                        onTap: () {
                                          cubit.filePick();
                                        },
                                        child: Container(
                                            height: height * 0.12,
                                            width: width * 0.05,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.upload_file,
                                                  size: 40,
                                                  color: Colors.grey[600],
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                Text(
                                                  'تحميل',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: cairo,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      InkWell(
                                        radius: 20,
                                        onTap: () {
                                          cubit.deleteImage();
                                        },
                                        child: Container(
                                          height: height * 0.12,
                                          width: width * 0.05,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                spreadRadius: 3,
                                                blurRadius: 10,
                                                offset: Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete,
                                                size: 40,
                                                color: Colors.grey[600],
                                              ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              Text(
                                                'حذف',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: cairo,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              // fields
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    textDirection: TextDirection.rtl,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FormTextInput(
                                        width: width * 0.8,
                                        validator: validateName,
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      FormTextInput(
                                        width: width * 0.7,
                                        hintText: 'الرقم القومي ',
                                        controller: idNumTextController,
                                        onChange: (value) {
                                          if (value.isEmpty) {
                                            // مسح القيمة في حقل تاريخ الميلاد
                                            dateOfBirth.clear();
                                            // مسح القيمة في حقل النوع
                                            cubit.setGender(null);
                                          } else {
                                            cubit.FromNationalId(value);
                                          }
                                        },
                                        validator: validateIdNum,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        type: TextInputType.number,
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      FormTextInput(
                                        width: width * 0.6,
                                        hintText: 'تاريخ الميلاد',
                                        validator: validateDateOfBirth,
                                        controller: dateOfBirth,
                                        readOnly: true,
                                        // inputFormatters: [
                                        //   FilteringTextInputFormatter
                                        //       .digitsOnly
                                        // ],
                                        // type: TextInputType.datetime,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        'المحافظة',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'cairo',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.008,
                                      ),
                                      CustomDropdownFormField<String>(
                                        value: cubit.selectedGovernorate,
                                        items: governorates
                                            .map((selectedGovernorate) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              selectedGovernorate,
                                              style: TextStyle(
                                                fontFamily: "cairo",
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            value: selectedGovernorate,
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          cubit.setGovernate(value);
                                        },
                                        hintText: 'المحافظة',
                                        width: width,
                                        height:
                                            height, // يمكنك تعديل هذه القيمة حسب الحاجة
                                        validator: (value) =>
                                            validateGovernorate(value,
                                                idNumTextController.text),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      FormTextInput(
                                        width: width * 0.5,
                                        hintText: 'المدينة',
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text(
                                        'النوع',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'cairo',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.008,
                                      ),
                                      CustomDropdownFormField<String>(
                                        value: cubit.gender,
                                        items: ['ذكر', 'أنثى'].map((gender) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              gender,
                                              style: TextStyle(
                                                fontFamily: "cairo",
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            value: gender,
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          cubit.setGender(value);
                                        },
                                        hintText: 'النوع',
                                        width: width,
                                        height:
                                            height, // يمكنك تعديل هذه القيمة حسب الحاجة
                                        validator: (value) => validateGender(
                                            value, idNumTextController.text),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text(
                                        'السن',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'cairo',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.008,
                                      ),
                                      Container(
                                        width: width * 0.14,
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            cubit.duration != null
                                                ? "عام : ${cubit.duration!.years.toString()} , شهر : ${cubit.duration!.months.toString()} , يوم : ${cubit.duration!.days.toString()} "
                                                : "0",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'cairo',
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      FormTextInput(
                                        width: width * 0.8,
                                        hintText: 'العنوان',
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      FormTextInput(
                                        width: width * 0.6,
                                        hintText: 'رقم الهاتف',
                                        validator: validatePhoneNumber,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        type: TextInputType.phone,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            'بيانات أولياء الأمور',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: cairo,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            color: bgColor.withOpacity(0.4),
                            alignment: Alignment.center,
                            height: height * 0.005,
                            width: width * 0.4,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                textDirection: TextDirection.rtl,
                                children: [
                                  FormTextInput(
                                      width: width * 0.8,
                                      validator: validateName,
                                      hintText: 'اسم الأب'),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  FormTextInput(
                                    width: width * 0.7,
                                    hintText: 'رقم موبايل الأب',
                                    validator: validatePhoneNumber,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    type: TextInputType.phone,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                textDirection: TextDirection.rtl,
                                children: [
                                  FormTextInput(
                                    width: width * 0.8,
                                    validator: validateName,
                                    hintText: 'اسم الأم',
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  FormTextInput(
                                    width: width * 0.7,
                                    hintText: 'رقم موبايل الأم',
                                    validator: validatePhoneNumber,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    type: TextInputType.phone,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Center(
                            child: CustomButton(
                              buttontext: 'إضافة طالب',
                              width: 0.33,
                              height: 0.12,
                              bordercolor: bgColor,
                              borderradius: 10,
                              fontsize: 22,
                              fontweight: FontWeight.bold,
                              fontcolor: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print(state);
                                } else {
                                  _formValidatorCubit.updateAutovalidateMode(
                                      AutovalidateMode.always);
                                }
                              },
                            ),
                          ),
                        ],
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
