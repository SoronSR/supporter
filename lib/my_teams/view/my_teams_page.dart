// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_api/football_api.dart';
import 'package:supporter/fixtures/fixtures.dart';
import 'package:supporter/l10n/l10n.dart';
import 'package:supporter/my_teams/cubit/my_teams_cubit.dart';
import 'package:supporter/team_details/team_details.dart';
import 'package:supporter/team_search/cubit/team_search_cubit.dart';

class MyTeamsPage extends StatelessWidget {
  const MyTeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyTeamsView();
  }
}

class MyTeamsView extends StatelessWidget {
  const MyTeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.myTeamsAppBarTitle,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 10, 20),
            child: FloatingActionButton.extended(
              elevation: 2,
              onPressed: () async {
                await showSearch<Team?>(
                  context: context,
                  delegate: _TeamSearchDelegate(
                    BlocProvider.of<TeamSearchCubit>(context),
                  ),
                );
              },
              label: Text(l10n.myTeamsAppBarFloatingActionButtonLabel),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MyTeamsCubit, MyTeamsState>(
        builder: (context, state) {
          return const _TeamList();
        },
      ),
    );
  }
}

class _TeamList extends StatelessWidget {
  const _TeamList();

  @override
  Widget build(BuildContext context) {
    final teams = context.watch<MyTeamsCubit>().state.teams;

    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(teams[index].id.toString()),
          onDismissed: (direction) {
            context.read<MyTeamsCubit>().removeTeam(teams[index]);
          },
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                TeamDetailsPage.route(team: teams[index]),
              );
            },
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CachedNetworkImage(
                imageUrl: teams[index].logo,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(teams[index].name),
          ),
        );
      },
    );
  }
}

class _TeamSearchDelegate extends SearchDelegate<Team?> {
  final Cubit<TeamSearchState> teamBloc;
  _TeamSearchDelegate(this.teamBloc);

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
    if (query.length > 3) {
      context.read<TeamSearchCubit>().searchFor(query);
      return const _SearchResult();
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult();

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    final status =
        context.select((TeamSearchCubit cubit) => cubit.state.status);

    switch (status) {
      case TeamSearchStatus.initial:
        return const SizedBox(
          key: Key('fixturesView_initial_sizedBox'),
        );
      case TeamSearchStatus.loading:
        return const Center(
          key: Key('fixturesView_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case TeamSearchStatus.failure:
        return const Center(
          key: Key('fixturesView_failure_text'),
          child: Text('l10n.teamsFetchErrorMessage'),
        );
      case TeamSearchStatus.success:
        return ListView(
          children: context
              .select((TeamSearchCubit cubit) => cubit.state.teams!)
              .map((team) {
            return ListTile(
              onTap: () {
                context.read<MyTeamsCubit>().addTeam(team);
                Navigator.of(context).pop();
              },
              subtitle: Text(team.country),
              title: Text(team.name),
              leading: CachedNetworkImage(
                imageUrl: team.logo,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          }).toList(),
        );
    }
  }
}
