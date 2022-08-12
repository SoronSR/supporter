// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_fixture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixtureFixture _$FixtureFixtureFromJson(Map<String, dynamic> json) =>
    FixtureFixture(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$FixtureFixtureToJson(FixtureFixture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'timestamp': instance.timestamp,
    };
