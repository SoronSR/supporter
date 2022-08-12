import 'package:football_api/football_api.dart';

/// Thrown when an error occurs while looking up teams.
class TeamsException implements Exception {}

/// Thrown when an error occurs while performing a search.
class SearchException implements Exception {}

/// {@template rocket_repository}
/// A Dart class which exposes methods to implement teams-related
/// functionality.
/// {@endtemplate}
class TeamRepository {
  /// {@macro team_repository}
  TeamRepository({FootballApiClient? footballApiClient})
      : _footballApiClient = footballApiClient ?? FootballApiClient();

  final FootballApiClient _footballApiClient;

  /// Returns a list of all Teams.
  ///
  /// Throws a [TeamsException] if an error occurs.
  Future<List<Team>> fetchAllTeams() {
    try {
      return _footballApiClient.fetchAllTeams();
    } on Exception {
      throw TeamsException();
    }
  }

  Future<List<Team>> searchFor(String query) {
    try {
      return _footballApiClient.searchFor(query);
    } on Exception {
      throw TeamsException();
    }
  }
}
