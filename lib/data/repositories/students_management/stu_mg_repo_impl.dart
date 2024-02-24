import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_ai/core/params/endpoints.dart';
import 'package:school_ai/core/utils/errrors/failure.dart';
import 'package:school_ai/core/utils/network/api_services.dart';
import 'package:school_ai/core/utils/service_locator.dart';
import 'package:school_ai/data/models/students/students.dart';
import 'package:school_ai/data/repositories/hive_repo/hive_repo.dart';
import 'package:school_ai/data/repositories/students_management/stu_mg_repo.dart';

class StuMgRepoImpl extends StuMgRepo {
  final ApiServices apiServices;

  StuMgRepoImpl(this.apiServices);
  late final HiveRepo hiveRepo = getIt.get<HiveRepo>();

  @override
  // LoginRepoImpl.dart

  @override
  Future<Either<Failure, Students>> addStudent(
    String name,
    int nationalID,
    DateTime dateOfBirth,
    int phoneNumber,
    String fatherName,
    String motherName,
    int motherPhoneNumber,
    int fatherPhoneNumber,
    String gender,
  ) async {
    final formData = FormData.fromMap({
      "name": name,
      "date_of_birth": dateOfBirth,
      "phone_number": phoneNumber,
      "father_name": fatherName,
      "mother_name": motherName,
      "mother_phone_number": motherPhoneNumber,
      "father_phone_number": fatherPhoneNumber,
      "national_ID": nationalID,
      "gender": gender,
    });
    try {
      final response = await apiServices.post(
        Endpoints.addStudent,
        formData,
        Options(
          contentType: "multipart/form-data",
          headers: {
            "Content-Type": "multipart/form-data",
            "Authorization": hiveRepo.get("token")
          },
        ),
      );
      debugPrint(
        " implmenation = ${response.toString()}",
      );

      final studentData = response; // Extract data field
      final allStudents = Students.fromResponse(studentData);
      debugPrint(
        " add user impl = $allStudents",
      );
      if (response['data'] == null || response['actionDone'] == false) {
        return Left(AuthinFailure.fromResponse(response));
      }
      return Right(allStudents);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure.fromDioException(e as DioException));
    }
  }

  @override
  Future<Either<Failure, Students>> deleteStudent(int pk) {
    // TODO: implement deleteStudent
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Students>> getAllStudents(String token) {
    // TODO: implement getAllStudents
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Students>> updateStudent(
    String name,
    String token,
    int nationalID,
    DateTime dateOfBirth,
    int phoneNumber,
    String fatherName,
    String motherName,
    int motherPhoneNumber,
    int fatherPhoneNumber,
    String gender,
  ) {
    // TODO: implement updateStudent
    throw UnimplementedError();
  }
}
