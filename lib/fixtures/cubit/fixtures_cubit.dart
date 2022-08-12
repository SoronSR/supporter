import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fixture_repository/fixture_repository.dart';
import 'package:football_api/football_api.dart';

part 'fixtures_state.dart';

class FixturesCubit extends Cubit<FixturesState> {
  FixturesCubit({
    required FixtureRepository fixtureRepository,
  })  : _fixtureRepository = fixtureRepository,
        super(const FixturesState());

  final FixtureRepository _fixtureRepository;

  Future<void> fetchFixturesToCome(int teamId) async {
    emit(
      FixturesState(
        status: FixturesStatus.loading,
        fixtures: state.fixtures,
      ),
    );

    try {
      final fixtures = await _fixtureRepository.fetchFixturesToCome(teamId);
      emit(
        FixturesState(
          status: FixturesStatus.success,
          fixtures: fixtures,
        ),
      );
    } on Exception {
      emit(
        FixturesState(
          status: FixturesStatus.failure,
          fixtures: state.fixtures,
        ),
      );
    }
  }
}
