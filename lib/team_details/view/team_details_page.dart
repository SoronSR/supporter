import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_api/football_api.dart';
import 'package:player_repository/player_repository.dart';
import 'package:supporter/players/players.dart';

class TeamDetailsPage extends StatelessWidget {
  const TeamDetailsPage({super.key});

  static Route<void> route({required Team team}) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => PlayersCubit(
          playerRepository: context.read<PlayerRepository>(),
        )..fetchSquadPlayers(team.id),
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
    final status = context.select((PlayersCubit cubit) => cubit.state.status);

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Container(),
    );
  }
}
