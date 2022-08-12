// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:fixture_repository/fixture_repository.dart';
import 'package:supporter/app/app.dart';
import 'package:supporter/bootstrap.dart';
import 'package:team_repository/team_repository.dart';

void main() {
  final teamRepository = TeamRepository();
  final fixtureRepository = FixtureRepository();

  bootstrap(
    () => App(
      teamRepository: teamRepository,
      fixtureRepository: fixtureRepository,
    ),
  );
}
