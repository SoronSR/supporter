// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_teams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixtureTeams _$FixtureTeamsFromJson(Map<String, dynamic> json) => FixtureTeams(
      home: FixtureTeam.fromJson(json['home'] as Map<String, dynamic>),
      away: FixtureTeam.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureTeamsToJson(FixtureTeams instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };
