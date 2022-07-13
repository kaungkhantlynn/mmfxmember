import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../routes/routes.dart';

class MMfx extends StatelessWidget {
  const MMfx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var localizationDelegate = LocalizedApp.of(context).delegate;
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // localizationDelegate
      ],
      // supportedLocales: localizationDelegate.supportedLocales,
      // locale: localizationDelegate.currentLocale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),

      routes: Routes.routes,
      initialRoute: '/check_state',
      // initialRoute: SplashScreen.route,
      // initialRoute: '/mmfx_main',
      // initialRoute: '/login',
      // initialRoute: '/mmfx_author',
      // initialRoute: '/test',
      // initialRoute: '/summernote',
    );
  }
}
