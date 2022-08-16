// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable(includeIfNull: false)
class Team extends Equatable {
  final int id;

  @JsonKey(defaultValue: '')
  final String name;

  @JsonKey(defaultValue: '')
  final String country;

  final bool national;

  @JsonKey(defaultValue: '')
  final String logo;

  @JsonKey(defaultValue: '')
  final String code;

  @JsonKey(defaultValue: 1000)
  final int founded;

  const Team({
    required this.id,
    required this.name,
    required this.country,
    required this.national,
    required this.logo,
    required this.code,
    required this.founded,
  });

  @override
  List<Object> get props {
    return [id, name, country, national, logo, code, founded];
  }

  /// Converts a JSON [Map] into a [Team] instance.
  static Team fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  /// Converts this [Team] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$TeamToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'country': country,
      'national': national,
      'logo': logo,
      'code': code,
      'founded': founded,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'] as int,
      name: map['name'] as String,
      country: map['country'] as String,
      national: map['national'] as bool,
      logo: map['logo'] as String,
      code: map['code'] as String,
      founded: map['founded'] as int,
    );
  }
}
