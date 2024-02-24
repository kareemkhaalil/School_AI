import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'data.dart'; // تأكد من وجود import لـ Data

class LoggedUser extends Equatable {
  final Data? data;
  final String? msg;
  final bool? actionDone;

  const LoggedUser({this.data, this.msg, this.actionDone});

  factory LoggedUser.fromResponse(Map<String, dynamic> response) {
    final userData = response['data'] as Map<String, dynamic>;
    return LoggedUser(
      data: Data.fromMap(userData),
      msg: response['msg'] as String?,
      actionDone: response['actionDone'] as bool?,
    );
  }

  // Remove unnecessary methods: fromMap, fromJson, toMap

  @override
  List<Object?> get props => [data, msg, actionDone];
}
