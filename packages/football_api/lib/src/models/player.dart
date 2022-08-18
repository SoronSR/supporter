import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player extends Equatable {
  final int id;
  final String name;
  final int age;
  @JsonKey(defaultValue: -1)
  final int? number;
  final String position;
  final String photo;

  const Player({
    required this.id,
    required this.name,
    required this.age,
    required this.number,
    required this.position,
    required this.photo,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      age,
      number!,
      position,
      photo,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'number': number,
      'position': position,
      'photo': photo,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as int,
      number: map['number'] as int,
      position: map['position'] as String,
      photo: map['photo'] as String,
    );
  }

  /// Converts a JSON [Map] into a [Player] instance.
  static Player fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  /// Converts this [Player] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
