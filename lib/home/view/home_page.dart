import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supporter/home/home.dart';
import 'package:supporter/l10n/l10n.dart';
import 'package:supporter/my_teams/my_teams.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final screens = [
    const MyTeamsPage(),
    const Center(
      child: Text('2'),
    ),
    const Center(
      child: Text('3'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final index =
        context.select((HomeCubit cubit) => cubit.state.selectedIndex);

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (value) {
          context.read<HomeCubit>().setSelectedIndex(value);
        },
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.sports_soccer),
            icon: const Icon(Icons.sports_soccer_outlined),
            label: l10n.homeBottomNavigationMyTeams,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.calendar_month),
            icon: const Icon(Icons.calendar_month_outlined),
            label: l10n.homeBottomNavigationCalendar,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.settings),
            icon: const Icon(Icons.settings_outlined),
            label: l10n.homeBottomNavigationSettings,
          ),
        ],
        selectedIndex: index,
      ),
    );
  }
}
