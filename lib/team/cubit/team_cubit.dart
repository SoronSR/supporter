import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_repository/team_repository.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit({
    required TeamRepository teamRepository,
  })  : _teamRepository = teamRepository,
        super(TeamState());

  final TeamRepository _teamRepository;
}
