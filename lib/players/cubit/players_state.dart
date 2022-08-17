part of 'players_cubit.dart';

enum PlayersStatus { inital, loading, success, failure }

class PlayersState extends Equatable {
  const PlayersState({
    this.status = PlayersStatus.inital,
    this.players = const [],
  });

  final PlayersStatus status;
  final List<Player> players;

  @override
  List<Object> get props => [status, players];
}
