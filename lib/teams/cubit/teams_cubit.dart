import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_api/football_api.dart';
import 'package:team_repository/team_repository.dart';

part 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit({
    required TeamRepository teamRepository,
  })  : _teamRepository = teamRepository,
        super(const TeamsState());

  final TeamRepository _teamRepository;

  Future<void> fetchAllTeams() async {
    emit(
      TeamsState(
        status: TeamsStatus.loading,
        teams: state.teams,
      ),
    );

    try {
      final teams = await _teamRepository.fetchAllTeams();
      emit(
        TeamsState(
          status: TeamsStatus.success,
          teams: teams,
        ),
      );
    } on Exception {
      emit(
        TeamsState(
          status: TeamsStatus.failure,
          teams: state.teams,
        ),
      );
    }
  }
}
