part of 'team_details_cubit.dart';

class TeamDetailsState extends Equatable {
  const TeamDetailsState({
    required this.team,
    this.tabIndex = 0,
  });

  final Team team;
  final int tabIndex;

  @override
  List<Object> get props => [team];
}
