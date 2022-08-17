// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:fixture_repository/fixture_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:player_repository/player_repository.dart';
import 'package:supporter/app/app.dart';
import 'package:supporter/bootstrap.dart';
import 'package:team_repository/team_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final teamRepository = TeamRepository();
  final fixtureRepository = FixtureRepository();
  final playerRepository = PlayerRepository();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  await bootstrap(
    () => App(
      teamRepository: teamRepository,
      fixtureRepository: fixtureRepository,
      playerRepository: playerRepository,
    ),
  );
}
