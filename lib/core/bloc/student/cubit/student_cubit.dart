import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:bloc/bloc.dart';
import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:school_ai/core/utils/constants.dart';
import 'package:school_ai/core/utils/validation.dart/validator.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> with Validator {
  StudentCubit() : super(StudentCubitInitial());

  final TextEditingController nationalIdController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  String? gender;
  DateDuration? duration;
  var image;
  String? selectedGovernorate;

  void FromNationalId(String nationalId) {
    String? validationError = validateIdNum(nationalId);
    if (validationError != null) {
      // إذا كان هناك خطأ في الرقم القومي، فعدم تحديث الجنس
      // ويمكنك رمي استثناء أو طباعة رسالة خطأ
      print(validationError);
      return;
    }

    String idNumStr = nationalId;
    String day = idNumStr.substring(5, 7);
    String month = idNumStr.substring(3, 5);
    String year = idNumStr.substring(1, 3);
    int cen = int.parse(idNumStr.substring(0, 1));

    if (cen == 2) {
      year = (int.parse(year) + 1900).toString();
    } else {
      year = (int.parse(year) + 2000).toString();
    }

    DateTime birthDateFromId =
        DateTime(int.parse(year), int.parse(month), int.parse(day));
    String formattedDate = DateFormat('yyyy-MM-dd').format(birthDateFromId);

    dateOfBirthController.text = formattedDate;
    duration = AgeCalculator.age(birthDateFromId);
    debugPrint(duration.toString());

    String genderFromId = idNumStr.substring(12, 13);

    if (int.parse(genderFromId) % 2 == 1) {
      gender = "ذكر";
    } else {
      gender = "أنثى";
    }

    emit(StudentCubitAddGender(gender));
    // قم بالتحقق من النوع مباشرة بعد تحديث الجنس
    validateGender(gender, nationalId);
    String governorateCode = idNumStr.substring(7, 9);
    if (governoratesCodes.contains(governorateCode)) {
      int index = governoratesCodes.indexOf(governorateCode);
      selectedGovernorate = governorates[index];
      // يمكنك استخدام selectedGovernorate كمتغير لاحقاً حسب احتياجاتك
    }
    emit(StudentCubitAddGovernment(selectedGovernorate!));
  }

  Future filePick() async {
    var result = await FilePicker.platform.pickFiles();
    if (result != null) {
      var logoBase64 = result.files.first.bytes;
      image = logoBase64;
      emit(PickStudentImage(logoBase64!));
      return logoBase64;
    }
  }

  Future deleteImage() async {
    image = "";
    emit(DeleteStudentImage(image));
    return image;
  }

  void setGender(String? value) {
    gender = value;
    emit(StudentCubitAddGender(value));
  }

  void setGovernate(String? value) {
    selectedGovernorate = value;
    emit(StudentCubitAddGender(value));
  }
}
