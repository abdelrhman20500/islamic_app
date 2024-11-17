import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic_app/provider/setting_provider.dart';
import 'package:islamic_app/ui/screens/details/details_screen.dart';
import 'package:islamic_app/ui/screens/home/home_screen.dart';
import 'package:islamic_app/ui/screens/splash/splash_screen.dart';
import 'package:islamic_app/ui/uitls/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  late SettingProvider provider;

  @override
  Widget build(BuildContext context) {

    provider =Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("ar")],
      locale: Locale(provider.currentLocale),
      /// theme mode دي اللي بتحدد الابلكيشن هيشتغل dark or light
      themeMode: provider.currentMode,
      /// تبع light mode
      theme:AppTheme.lightTheme,
      /// تبع dark mode
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName :(_) => SplashScreen(),
        HomeScreen.routeName :(_) =>HomeScreen(),
        DetailsScreen.routeName :(_) => DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName ,
      // home: RadioTab(),
    );
  }
}


