import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class LoggedUser extends Equatable {
  final Data? data;
  final String? msg;
  final bool? actionDone;

  const LoggedUser({this.data, this.msg, this.actionDone});

  factory LoggedUser.fromMap(Map<String, dynamic> data) => LoggedUser(
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
        msg: data['msg'] as String?,
        actionDone: data['actionDone'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'msg': msg,
        'actionDone': actionDone,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoggedUser].
  factory LoggedUser.fromJson(String data) {
    return LoggedUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CurrentUser] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [data, msg, actionDone];
}
