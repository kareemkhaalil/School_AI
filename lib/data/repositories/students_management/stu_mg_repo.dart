import 'package:dartz/dartz.dart';
import 'package:school_ai/core/utils/errrors/failure.dart';
import 'package:school_ai/data/models/students/students.dart';

abstract class StuMgRepo {
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
  );
  Future<Either<Failure, Students>> getAllStudents(
    String token,
  );
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
  );
  Future<Either<Failure, Students>> deleteStudent(
    int pk,
  );
}
