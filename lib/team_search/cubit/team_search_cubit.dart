// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_api/football_api.dart';
import 'package:team_repository/team_repository.dart';

part 'team_search_state.dart';

class TeamSearchCubit extends Cubit<TeamSearchState> {
  TeamSearchCubit({
    required TeamRepository teamRepository,
  })  : _teamRepository = teamRepository,
        super(const TeamSearchState());

  final TeamRepository _teamRepository;

  Future<void> searchFor(String query) async {
    emit(
      TeamSearchState(
        status: TeamSearchStatus.loading,
        teams: state.teams,
      ),
    );

    try {
      final teams = await _teamRepository.searchFor(query);
      emit(
        TeamSearchState(
          status: TeamSearchStatus.success,
          teams: teams,
        ),
      );
    } on Exception {
      emit(
        TeamSearchState(
          status: TeamSearchStatus.failure,
          teams: state.teams,
        ),
      );
    }
  }
}
