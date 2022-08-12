part of 'team_search_cubit.dart';

enum TeamSearchStatus { initial, loading, success, failure }

class TeamSearchState extends Equatable {
  const TeamSearchState({
    this.status = TeamSearchStatus.initial,
    this.teams,
  });

  final TeamSearchStatus status;
  final List<Team>? teams;

  @override
  List<Object?> get props => [status, teams];
}
