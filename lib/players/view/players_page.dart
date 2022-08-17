import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player_repository/player_repository.dart';
import 'package:supporter/players/players.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlayersPage();
  }
}

class PlayersView extends StatelessWidget {
  const PlayersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Squad')),
      body: const _PlayersList(),
    );
  }
}

class _PlayersList extends StatelessWidget {
  const _PlayersList();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
