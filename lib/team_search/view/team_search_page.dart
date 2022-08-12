import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:supporter/l10n/l10n.dart';
import 'package:supporter/team_search/team_search.dart';
import 'package:supporter/teams/teams.dart';
import 'package:team_repository/team_repository.dart';

class TeamSearchPage extends StatelessWidget {
  const TeamSearchPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => TeamSearchCubit(
          teamRepository: context.read<TeamRepository>(),
        ),
        child: TeamSearchView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const TeamSearchPage();
  }
}

class TeamSearchView extends StatelessWidget {
  const TeamSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildFloatingSearchBar(context),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait = false;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 700),
      onQueryChanged: (query) {
        if (query.length > 3) {
          context.read<TeamSearchCubit>().searchFor(query);
        }
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: true,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Material(
            color: Colors.white,
            elevation: 4.0,
            child: _SearchResult(),
          ),
        );
      },
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: context
              .select((TeamSearchCubit cubit) => cubit.state.teams!)
              .map((team) {
            return ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              subtitle: Text(team.country),
              title: Text(team.name),
              leading: Image.network(team.logo),
            );
          }).toList(),
        );
    }
  }
}
