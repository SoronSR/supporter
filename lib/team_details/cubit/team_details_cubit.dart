import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_api/football_api.dart';

part 'team_details_state.dart';

class TeamDetailsCubit extends Cubit<TeamDetailsState> {
  TeamDetailsCubit({required Team team}) : super(TeamDetailsState(team: team));

  void setTabIndex(int tabIndex) {
    emit(
      TeamDetailsState(team: state.team, tabIndex: tabIndex),
    );
  }
}
