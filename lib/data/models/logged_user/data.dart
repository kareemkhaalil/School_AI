import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? name;
  final String? permission;
  final String? token;

  const Data({this.name, this.permission, this.token});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        name: data['name'] as String?,
        permission: data['permission'] as String?,
        token: data['token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'permission': permission,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name, permission, token];
}
