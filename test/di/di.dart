import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  generateForDir: ['lib', 'test'],
  preferRelativeImports: true,
)
FutureOr<void> configureDependencies() =>
    getIt.init(environment: Environment.test);
