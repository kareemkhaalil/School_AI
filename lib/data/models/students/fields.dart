import 'dart:convert';

import 'package:equatable/equatable.dart';

class Fields extends Equatable {
  final String? name;
  final String? dateOfBirth;
  final int? nationalId;
  final String? phoneNumber;
  final String? motherName;
  final String? fatherName;
  final String? motherPhoneNumber;
  final String? fatherPhoneNumber;
  final String? gender;

  const Fields({
    this.name,
    this.dateOfBirth,
    this.nationalId,
    this.phoneNumber,
    this.motherName,
    this.fatherName,
    this.motherPhoneNumber,
    this.fatherPhoneNumber,
    this.gender,
  });

  factory Fields.fromMap(Map<String, dynamic> data) => Fields(
        name: data['name'] as String?,
        dateOfBirth: data['date_of_birth'] as String?,
        nationalId: data['national_ID'] as int?,
        phoneNumber: data['phone_number'] as String?,
        motherName: data['mother_name'] as String?,
        fatherName: data['father_name'] as String?,
        motherPhoneNumber: data['mother_phone_number'] as String?,
        fatherPhoneNumber: data['father_phone_number'] as String?,
        gender: data['gender'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'date_of_birth': dateOfBirth,
        'national_ID': nationalId,
        'phone_number': phoneNumber,
        'mother_name': motherName,
        'father_name': fatherName,
        'mother_phone_number': motherPhoneNumber,
        'father_phone_number': fatherPhoneNumber,
        'gender': gender,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Fields].
  factory Fields.fromJson(String data) {
    return Fields.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Fields] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      name,
      dateOfBirth,
      nationalId,
      phoneNumber,
      motherName,
      fatherName,
      motherPhoneNumber,
      fatherPhoneNumber,
      gender,
    ];
  }
}
