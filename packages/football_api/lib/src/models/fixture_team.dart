// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fixture_team.g.dart';

@JsonSerializable(includeIfNull: false)
class FixtureTeam extends Equatable {
  final int id;
  final String name;
  final String logo;
  final bool? winner;

  const FixtureTeam({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      logo,
      winner,
    ];
  }

  factory FixtureTeam.fromJson(Map<String, dynamic> json) =>
      _$FixtureTeamFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureTeamToJson(this);
}
