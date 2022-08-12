import 'package:football_api/football_api.dart';

/// Thrown when an error occurs while looking up teams.
class FixturesException implements Exception {}

/// Thrown when an error occurs while performing a search.
class SearchException implements Exception {}

/// {@template rocket_repository}
/// A Dart class which exposes methods to implement teams-related
/// functionality.
/// {@endtemplate}
class FixtureRepository {
  /// {@macro team_repository}
  FixtureRepository({FootballApiClient? footballApiClient})
      : _footballApiClient = footballApiClient ?? FootballApiClient();

  final FootballApiClient _footballApiClient;

  /// Returns a list of all Teams.
  ///
  /// Throws a [FixturesException] if an error occurs.
  Future<List<Fixture>> fetchFixturesToCome(int teamId) {
    try {
      return _footballApiClient.fetchFixturesToCome(teamId);
    } on Exception {
      throw FixturesException();
    }
  }
}
