// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:football_api/football_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fixture_teams.g.dart';

@JsonSerializable()
class FixtureTeams extends Equatable {
  final FixtureTeam home;
  final FixtureTeam away;

  const FixtureTeams({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props {
    return [
      home,
      away,
    ];
  }

  factory FixtureTeams.fromJson(Map<String, dynamic> json) =>
      _$FixtureTeamsFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureTeamsToJson(this);
}
