part of 'teams_cubit.dart';

enum TeamsStatus { initial, loading, success, failure }

class TeamsState extends Equatable {
  const TeamsState({
    this.status = TeamsStatus.initial,
    this.teams,
  });

  final TeamsStatus status;
  final List<Team>? teams;

  @override
  List<Object?> get props => [status, teams];
}
