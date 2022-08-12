import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supporter/fixtures/fixtures.dart';
import 'package:supporter/l10n/l10n.dart';
import 'package:supporter/team_search/team_search.dart';
import 'package:supporter/teams/teams.dart';
import 'package:team_repository/team_repository.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeamsCubit(
        teamRepository: context.read<TeamRepository>(),
      )..fetchAllTeams(),
      child: const TeamsView(),
    );
  }
}

class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: const Center(
        child: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final status = context.select((TeamsCubit cubit) => cubit.state.status);

    switch (status) {
      case TeamsStatus.initial:
        return const SizedBox(
          key: Key('teamsView_initial_sizedBox'),
        );
      case TeamsStatus.loading:
        return const Center(
          key: Key('teamsView_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case TeamsStatus.failure:
        return const Center(
          key: Key('teamsView_failure_text'),
          child: Text('l10n.teamsFetchErrorMessage'),
        );
      case TeamsStatus.success:
        return const _TeamList(
          key: Key('teamsView_success_teamList'),
        );
    }
  }
}

class _TeamList extends StatelessWidget {
  const _TeamList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final teams = context.select((TeamsCubit cubit) => cubit.state.teams!);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(l10n.myTeamsFloatingActionButtonAddTeam),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            TeamSearchPage.route(),
          );
        },
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            for (final team in teams) ...[
              ListTile(
                isThreeLine: true,
                onTap: () {
                  Navigator.of(context).push(
                    FixturesPage.route(teamId: team.id),
                  );
                },
                title: Text(team.name),
                subtitle: Text(
                  team.country,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Image.network(team.logo),
              ),
              const Divider(),
            ],
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text('test'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length >= 3) {
      print(query);
    }

    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     return const ListTile(
    //       title: Text('test'),
    //     );
    //   },
    // );

    return Container();
  }
}
