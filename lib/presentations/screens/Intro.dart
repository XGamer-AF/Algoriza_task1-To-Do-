import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_app/app_router.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/data/models/data_change_lang.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/cookies_class.dart';

import 'splash/splash_screen.dart';






final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class Intro extends StatefulWidget {
  final Data data;
  Intro(this.data);
  @override
  _IntroState createState() => _IntroState(data);

  static void setLocale(BuildContext context, String newLocale) async {
    _IntroState state = context.findAncestorStateOfType<_IntroState>()!;
    state.changeLanguage(newLocale);
  }
}

class _IntroState extends State<Intro> {
  String? locale;
  final Data data;
  _IntroState(this.data);
  var introKey = new GlobalKey<ScaffoldState>();
  String? _font;
  SpecificLocalizationDelegate? _specificLocalizationDelegate;



  @override
  void initState() {
    super.initState();
    setState(() {
      locale = data.lang;
      _font = locale == "ar" ? "fontArLight" : "fontEn";
      setLang(locale!);
    });
//
    this.setState(() {
      _specificLocalizationDelegate =
          SpecificLocalizationDelegate(new Locale(locale!));
    });




  }

  changeLanguage(String newLocale) {
    this.setState(() {
      locale = data.lang;
      setLang(locale!);
      _specificLocalizationDelegate =
          SpecificLocalizationDelegate(new Locale(newLocale));

      _font = locale == "ar" ? "fontArLight" : "fontEn";
    });
  }

  setLang(String value) async {
    await addStringToSF("lang", value);
  }

  Stream<Locale> setLocale(int choice) {
    var localeSubject = BehaviorSubject<Locale>();

    choice == 0
        ? localeSubject.sink.add(Locale('ar', ''))
        : localeSubject.sink.add(Locale('en', ''));

    return localeSubject.stream.distinct();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      child:  MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        key: introKey,
        title: 'Algoriza Task 1',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          new FallbackCupertinoLocalisationsDelegate(),
          //app-specific localization
          _specificLocalizationDelegate!
        ],
        theme: ownThemeData,
        supportedLocales: [Locale('ar'), Locale('en')],
        locale: _specificLocalizationDelegate!.overriddenLocale,
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        onGenerateRoute: AppRouter.generateRoute,
        home: SplashScreen(),
      ),
      onWillPop: () async => true,
    );
  }


}
