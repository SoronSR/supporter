import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supporter/team/cubit/team_cubit.dart';
import 'package:team_repository/team_repository.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  static Route<void> route({required int teamId}) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => TeamCubit(
          teamRepository: context.read<TeamRepository>(),
        ),
        child: const TeamView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const TeamPage();
  }
}

class TeamView extends StatelessWidget {
  const TeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('team_page')),
    );
  }
}
