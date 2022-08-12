import 'package:fixture_repository/fixture_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supporter/fixtures/fixtures.dart';
import 'package:supporter/l10n/l10n.dart';

class FixturesPage extends StatelessWidget {
  const FixturesPage({super.key});

  static Route<void> route({required int teamId}) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => FixturesCubit(
          fixtureRepository: context.read<FixtureRepository>(),
        )..fetchFixturesToCome(teamId),
        child: const FixturesView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const FixturesPage();
  }
}

class FixturesView extends StatelessWidget {
  const FixturesView({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;

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
    final l10n = context.l10n;
    final status = context.select((FixturesCubit cubit) => cubit.state.status);

    switch (status) {
      case FixturesStatus.initial:
        return const SizedBox(
          key: Key('fixturesView_initial_sizedBox'),
        );
      case FixturesStatus.loading:
        return const Center(
          key: Key('fixturesView_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case FixturesStatus.failure:
        return const Center(
          key: Key('fixturesView_failure_text'),
          child: Text('l10n.teamsFetchErrorMessage'),
        );
      case FixturesStatus.success:
        return const _FixtureList(
          key: Key('fixturesView_success_teamList'),
        );
    }
  }
}

class _FixtureList extends StatelessWidget {
  const _FixtureList({super.key});

  @override
  Widget build(BuildContext context) {
    final fixtures =
        context.select((FixturesCubit cubit) => cubit.state.fixtures!);

    return Scrollbar(
      child: ListView(
        children: [
          for (final fixture in fixtures) ...[
            ListTile(
              isThreeLine: true,
              onTap: () {},
              title: Text(
                '${fixture.teams.home.name} - ${fixture.teams.away.name}',
              ),
              subtitle: Text(
                fixture.fixture.date.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}
