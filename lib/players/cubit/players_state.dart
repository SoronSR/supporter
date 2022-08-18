part of 'players_cubit.dart';

enum PlayersStatus { initial, loading, success, failure }

class PlayersState extends Equatable {
  const PlayersState({
    this.status = PlayersStatus.initial,
    this.players = const [],
    this.isLoaded = false,
  });

  final PlayersStatus status;
  final List<Player> players;
  final bool isLoaded;

  @override
  List<Object> get props => [status, players];
}
