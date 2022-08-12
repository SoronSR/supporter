part of 'fixtures_cubit.dart';

enum FixturesStatus { initial, loading, success, failure }

class FixturesState extends Equatable {
  const FixturesState({
    this.status = FixturesStatus.initial,
    this.fixtures,
  });

  final FixturesStatus status;
  final List<Fixture>? fixtures;

  @override
  List<Object?> get props => [status, fixtures];
}
