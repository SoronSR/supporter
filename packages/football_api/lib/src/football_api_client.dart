import 'dart:convert';

import 'package:football_api/football_api.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

/// {@template football_api_client}
/// A Dart API Client for the API-FOOTBALL REST API.
/// Learn more at https://rapidapi.com/api-sports/api/api-football/
/// {@endtemplate}
class FootballApiClient {
  /// {@macro football_api_client}
  FootballApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  /// The host URL used for all API requests.
  ///
  /// Only exposed for testing purposes. Do not use directly.
  @visibleForTesting
  static const endpoint = 'api-football-v1.p.rapidapi.com';

  static const Map<String, String> headers = {
    'X-RapidAPI-Key': 'aeb7975284mshe38fb91bdf536e4p1b0d98jsn2c8e2c9a67d1',
    'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com',
  };

  final http.Client _httpClient;

  Future<List<Player>> fetchSquadPlayers(int teamId) async {
    String api = 'v3/players/squad';
    Map<String, String> queryParams = {
      'team': '$teamId',
    };

    final uri = Uri.http(endpoint, api, queryParams);
    final responseBody = await _get(uri, headers);

    try {
      return responseBody
          .map((item) =>
              Player.fromJson(item['players'] as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  Future<List<Team>> fetchAllTeams() async {
    String api = 'v3/teams';
    Map<String, String> queryParams = {
      'country': 'Spain',
    };

    final uri = Uri.https(endpoint, api, queryParams);
    final responseBody = await _get(uri, headers);

    try {
      return responseBody
          .map((item) => Team.fromJson(item['team'] as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  Future<List<Team>> searchFor(String query) async {
    String api = 'v3/teams';
    Map<String, String> queryParams = {
      'search': query,
    };

    final uri = Uri.https(endpoint, api, queryParams);
    final responseBody = await _get(uri, headers);

    try {
      return responseBody
          .map((dynamic item) =>
              Team.fromJson(item['team'] as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  Future<List<Fixture>> fetchFixturesToCome(int teamId) async {
    String api = 'v3/fixtures';
    Map<String, String> queryParams = {
      'next': '50',
      'team': teamId.toString(),
    };

    final uri = Uri.https(endpoint, api, queryParams);
    final responseBody = await _get(uri, headers);

    try {
      return responseBody
          .map((dynamic item) => Fixture.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  Future<List<dynamic>> _get(Uri uri, Map<String, String> headers) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri, headers: headers);
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      return json.decode(response.body)['response'] as List;
    } catch (_) {
      throw JsonDecodeException();
    }
  }
}
