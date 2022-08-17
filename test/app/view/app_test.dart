// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:fixture_repository/fixture_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:player_repository/player_repository.dart';
import 'package:supporter/app/app.dart';
import 'package:team_repository/team_repository.dart';

class MockTeamRepository extends Mock implements TeamRepository {}

class MockFixtureRepository extends Mock implements FixtureRepository {}

void main() {
  late TeamRepository teamRepository;
  late FixtureRepository fixtureRepository;
  late PlayerRepository playerRepository;

  setUp(() {
    teamRepository = TeamRepository();
    fixtureRepository = FixtureRepository();
    playerRepository = PlayerRepository();
  });

  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        App(
          teamRepository: teamRepository,
          fixtureRepository: fixtureRepository,
          playerRepository: playerRepository,
        ),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
