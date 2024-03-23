part of 'student_cubit.dart';

@immutable
sealed class StudentState extends Equatable {
  const StudentState();

  // ...

  @override
  List<Object> get props => [];
}

final class StudentCubitInitial extends StudentState {}

final class StudentCubitAddName extends StudentState {
  final String name;

  StudentCubitAddName(this.name);

  @override
  List<Object> get props => [name];
}

final class StudentCubitAddNationalId extends StudentState {
  final String nationalId;

  StudentCubitAddNationalId(this.nationalId);

  @override
  List<Object> get props => [nationalId];
}

final class StudentCubitAddDateOfBirth extends StudentState {
  final String dateOfBirth;

  StudentCubitAddDateOfBirth(this.dateOfBirth);

  @override
  List<Object> get props => [dateOfBirth];
}

final class StudentCubitAddGender extends StudentState {
  final String? gender;
  StudentCubitAddGender([String? gender]) : gender = gender ?? "Unknown";
  @override
  List<Object> get props => [gender!];
}

final class PickStudentImage extends StudentState {
  final Uint8List image;

  PickStudentImage(this.image);

  @override
  List<Object> get props => [image];
}

final class DeleteStudentImage extends StudentState {
  final String image;

  DeleteStudentImage(this.image);

  @override
  List<Object> get props => [image];
}

final class StudentCubitAddGovernment extends StudentState {
  final String government;

  StudentCubitAddGovernment(this.government);

  @override
  List<Object> get props => [government];
}
