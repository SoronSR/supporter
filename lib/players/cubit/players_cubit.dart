import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_api/football_api.dart';
import 'package:player_repository/player_repository.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit({required PlayerRepository playerRepository})
      : _playerRepository = playerRepository,
        super(const PlayersState());

  final PlayerRepository _playerRepository;

  Future<void> fetchSquadPlayers(int teamId) async {
    emit(
      PlayersState(
        status: PlayersStatus.loading,
        players: state.players,
      ),
    );

    try {
      final players = await _playerRepository.fetchSquadPlayers(teamId);

      emit(
        PlayersState(
          status: PlayersStatus.success,
          players: players,
          isLoaded: true,
        ),
      );
    } catch (e) {
      emit(
        PlayersState(
          status: PlayersStatus.failure,
          players: state.players,
        ),
      );
    }
  }
}
