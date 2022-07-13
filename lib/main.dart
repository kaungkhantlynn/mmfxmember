import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/components/service_locator.dart';
import 'ui/mmfx.dart';

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = AppBlocObserver();
  // localization
  // var delegate = await LocalizationDelegate.create(
  //     preferences: TranslatePreferences(),
  //     basePath: 'assets/i18n/',
  //     fallbackLocale: 'th',
  //     supportedLocales: ['en_US', 'th', 'th_2']);

  // await di.init();
  await setPreferredOrientations();
  runApp(MMfx());
  // await setupLocator();

  // BlocOverrides.runZoned(() => runApp(MMfx()), blocObserver: AppBlocObserver());

  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = SENTRY_DSN;
  //   },
  //   // Init your App.
  //   appRunner: () => runApp(LocalizedApp(delegate, FleetManagement())),
  // );
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
