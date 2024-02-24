import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'fields.dart';

class Datum extends Equatable {
  final String? model;
  final int? pk;
  final Fields? fields;

  const Datum({this.model, this.pk, this.fields});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        model: data['model'] as String?,
        pk: data['pk'] as int?,
        fields: data['fields'] == null
            ? null
            : Fields.fromMap(data['fields'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'model': model,
        'pk': pk,
        'fields': fields?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [model, pk, fields];
}
