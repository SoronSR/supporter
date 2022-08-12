import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class Team extends Equatable {
  final int id;
  final String name;
  final String country;
  final bool national;
  final String logo;

  const Team({
    required this.id,
    required this.name,
    required this.country,
    required this.national,
    required this.logo,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      country,
      national,
      logo,
    ];
  }

  /// Converts a JSON [Map] into a [Team] instance.
  static Team fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  /// Converts this [Team] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
