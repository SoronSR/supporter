// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixtureTeam _$FixtureTeamFromJson(Map<String, dynamic> json) => FixtureTeam(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      winner: json['winner'] as bool?,
    );

Map<String, dynamic> _$FixtureTeamToJson(FixtureTeam instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'logo': instance.logo,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('winner', instance.winner);
  return val;
}
