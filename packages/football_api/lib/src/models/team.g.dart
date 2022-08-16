// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      country: json['country'] as String? ?? '',
      national: json['national'] as bool,
      logo: json['logo'] as String? ?? '',
      code: json['code'] as String? ?? '',
      founded: json['founded'] as int? ?? 1000,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'national': instance.national,
      'logo': instance.logo,
      'code': instance.code,
      'founded': instance.founded,
    };
