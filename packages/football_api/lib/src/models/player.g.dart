// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      number: json['number'] as int? ?? -1,
      position: json['position'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'number': instance.number,
      'position': instance.position,
      'photo': instance.photo,
    };
