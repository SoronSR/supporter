// ignore_for_file: use_decorated_box

import 'dart:ui';

import 'package:fixture_repository/fixture_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_api/football_api.dart';
import 'package:player_repository/player_repository.dart';
import 'package:supporter/fixtures/fixtures.dart';
import 'package:supporter/players/players.dart';
import 'package:supporter/team_details/team_details.dart';

class TeamDetailsPage extends StatelessWidget {
  const TeamDetailsPage({super.key});

  static Route<void> route({required Team team}) {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TeamDetailsCubit(team: team),
          ),
          BlocProvider(
            create: (context) =>
                PlayersCubit(playerRepository: PlayerRepository())
                  ..fetchSquadPlayers(team.id),
          ),
          BlocProvider(
            create: (context) =>
                FixturesCubit(fixtureRepository: FixtureRepository())
                  ..fetchFixturesToCome(team.id),
          ),
        ],
        child: const TeamDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const TeamDetailsView();
  }
}

class TeamDetailsView extends StatelessWidget {
  const TeamDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final team = context.select((TeamDetailsCubit cubit) => cubit.state.team);

    const tabBar = TabBar(
      tabs: [
        Tab(text: 'Squad'),
        Tab(text: 'Fixtures'),
        Tab(text: 'Details'),
      ],
    );

    const tabBarView = TabBarView(
      children: [
        PlayersPage(),
        FixturesPage(),
        Icon(Icons.directions_bike),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          flexibleSpace: Image.network(
            team.logo,
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          title: Text(team.name),
          bottom: tabBar,
        ),
        body: tabBarView,
      ),
    );
  }
}
