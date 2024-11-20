import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../models/ayah/ayah.dart';
import 'package:hive/hive.dart';

part 'para.g.dart';

@HiveType(typeId: 2)
class Para {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final List<Ayah?>? ayahs;
  Para({
    this.number,
    this.ayahs,
  });

  Para copyWith({
    int? number,
    List<Ayah?>? ayahs,
  }) {
    return Para(
      number: number ?? this.number,
      ayahs: ayahs ?? this.ayahs,
    );
  }

  Para merge(Para model) {
    return Para(
      number: model.number ?? number,
      ayahs: model.ayahs ?? ayahs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'ayahs': ayahs?.map((x) => x?.toMap()).toList(),
    };
  }

  factory Para.fromMap(Map<String, dynamic> map) {
    return Para(
      number: map['number'],
      ayahs: List<Ayah>.from(map['ayahs']?.map((x) => Ayah.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Para.fromJson(String source) => Para.fromMap(json.decode(source));

  @override
  String toString() => 'Juz(number: $number, ayahs: $ayahs)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Para &&
        other.number == number &&
        listEquals(other.ayahs, ayahs);
  }

  @override
  int get hashCode => number.hashCode ^ ayahs.hashCode;
}
