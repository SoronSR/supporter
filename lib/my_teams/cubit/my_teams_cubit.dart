import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:football_api/football_api.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'my_teams_state.dart';

class MyTeamsCubit extends HydratedCubit<MyTeamsState> {
  MyTeamsCubit() : super(const MyTeamsState(teams: []));

  void addTeam(Team team) {
    final teams = List<Team>.from(state.teams);
    teams.add(team);
    emit(MyTeamsState(teams: teams));
  }

  void removeTeam(Team team) {
    // final teams = state.teams.remove(team);
    final teams = List<Team>.from(state.teams);

    if (teams.remove(team)) {
      emit(MyTeamsState(teams: teams));
    } else {
      throw Exception('Error deleting team from list');
    }
  }

  @override
  MyTeamsState? fromJson(Map<String, dynamic> json) {
    return MyTeamsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(MyTeamsState state) {
    return state.toMap();
  }
}
