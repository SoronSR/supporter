// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:fixture_repository/fixture_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:player_repository/player_repository.dart';
import 'package:supporter/home/home.dart';
import 'package:supporter/l10n/l10n.dart';
import 'package:supporter/my_teams/my_teams.dart';
import 'package:supporter/team_search/cubit/team_search_cubit.dart';
import 'package:team_repository/team_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required TeamRepository teamRepository,
    required FixtureRepository fixtureRepository,
    required PlayerRepository playerRepository,
  })  : _teamRepository = teamRepository,
        _fixtureRepository = fixtureRepository,
        _playerRepository = playerRepository;

  final TeamRepository _teamRepository;
  final FixtureRepository _fixtureRepository;
  final PlayerRepository _playerRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _teamRepository),
        RepositoryProvider.value(value: _fixtureRepository),
        RepositoryProvider.value(value: _playerRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TeamSearchCubit>(
            create: (BuildContext context) =>
                TeamSearchCubit(teamRepository: _teamRepository),
          ),
          BlocProvider<MyTeamsCubit>(
            create: (BuildContext context) => MyTeamsCubit(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
