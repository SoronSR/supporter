// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:football_api/football_api.dart';

class PlayerException implements Exception {}

class SearchException implements Exception {}

class PlayerRepository {
  PlayerRepository({FootballApiClient? footballApiClient})
      : _footballApiClient = footballApiClient ?? FootballApiClient();

  final FootballApiClient _footballApiClient;

  Future<List<Player>> fetchSquadPlayers(int teamId) {
    try {
      return _footballApiClient.fetchSquadPlayers(teamId);
    } catch (e) {
      throw PlayerException();
    }
  }
}
