import 'package:equatable/equatable.dart';
import 'package:football_api/football_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fixture.g.dart';

@JsonSerializable()
class Fixture extends Equatable {
  final FixtureFixture fixture;
  final FixtureTeams teams;

  const Fixture({
    required this.fixture,
    required this.teams,
  });

  @override
  List<Object?> get props {
    return [
      fixture,
      teams,
    ];
  }

  factory Fixture.fromJson(Map<String, dynamic> json) =>
      _$FixtureFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureToJson(this);
}
