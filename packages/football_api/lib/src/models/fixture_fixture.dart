// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fixture_fixture.g.dart';

@JsonSerializable()
class FixtureFixture extends Equatable {
  final int id;
  final DateTime date;
  final int timestamp;

  const FixtureFixture({
    required this.id,
    required this.date,
    required this.timestamp,
  });

  @override
  List<Object?> get props {
    return [
      id,
      date,
      timestamp,
    ];
  }

  factory FixtureFixture.fromJson(Map<String, dynamic> json) =>
      _$FixtureFixtureFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureFixtureToJson(this);
}
