import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'di/di.dart';
import 'presentation/config/bloc/config_cubit.dart';
import 'router/app_router.dart';
import 'router/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  await _lockPortraitOrientation();

  runApp(MyApp());
}

Future<void> _lockPortraitOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ConfigCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<ConfigCubit, ConfigState>(
          listenWhen: (previous, current) =>
              current.hasInternetConnection != previous.hasInternetConnection,
          listener: (context, state) {
            if (!state.hasInternetConnection) {
              appRouter.push(NoInternetConnectionRoute(
                onRefresh: () =>
                    context.read<ConfigCubit>().checkInternetConnection(),
              ));
            } else {
              appRouter.pop();
            }
          },
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
          ),
        );
      }),
    );
  }
}
