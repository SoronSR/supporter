import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player_repository/player_repository.dart';
import 'package:supporter/players/players.dart';
import 'package:supporter/team_details/team_details.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlayersView();
  }
}

class PlayersView extends StatelessWidget {
  const PlayersView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((PlayersCubit cubit) => cubit.state.status);

    switch (status) {
      case PlayersStatus.initial:
        return const SizedBox(
          key: Key('playersView_initial_sizedBox'),
        );
      case PlayersStatus.loading:
        return const Center(
          key: Key('playersView_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case PlayersStatus.failure:
        return const Center(
          key: Key('playersView_failure_text'),
          child: Text('l10n.teamsFetchErrorMessage'),
        );
      case PlayersStatus.success:
        return const _PlayersList(
          key: Key('playersView_success_teamList'),
        );
    }
  }
}

class _PlayersList extends StatelessWidget {
  const _PlayersList({super.key});

  @override
  Widget build(BuildContext context) {
    final players = context.select((PlayersCubit cubit) => cubit.state.players);

    return Scrollbar(
      child: ListView(
        children: [
          for (final player in players) ...[
            ListTile(
              leading: Image.network(player.photo),
              isThreeLine: true,
              onTap: () {},
              title: Text(player.name),
              subtitle: Text(player.position),
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}
