import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class Students extends Equatable {
  final List<Datum>? data;
  final String? msg;
  final bool? actionDone;

  const Students({this.data, this.msg, this.actionDone});

  factory Students.fromResponse(Map<String, dynamic> response) {
    final data = response['data'] as Map<String, dynamic>;
    return Students(
      data: [Datum.fromMap(data)],
      msg: response['msg'] as String?,
      actionDone: response['actionDone'] as bool?,
    );
  }
  // factory Students.fromMap(Map<String, dynamic> data) => Students(
  //       data: (data['data'] as List<dynamic>?)
  //           ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
  //           .toList(),
  //       msg: data['msg'] as String?,
  //       actionDone: data['actionDone'] as bool?,
  //     );

  // Map<String, dynamic> toMap() => {
  //       'data': data?.map((e) => e.toMap()).toList(),
  //       'msg': msg,
  //       'actionDone': actionDone,
  //     };

  // /// `dart:convert`
  // ///
  // /// Parses the string and returns the resulting Json object as [Students].
  // factory Students.fromJson(String data) {
  //   return Students.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  // /// `dart:convert`
  // ///
  // /// Converts [Students] to a JSON string.
  // String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [data, msg, actionDone];
}
