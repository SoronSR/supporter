// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fixture _$FixtureFromJson(Map<String, dynamic> json) => Fixture(
      fixture: FixtureFixture.fromJson(json['fixture'] as Map<String, dynamic>),
      teams: FixtureTeams.fromJson(json['teams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureToJson(Fixture instance) => <String, dynamic>{
      'fixture': instance.fixture,
      'teams': instance.teams,
    };
