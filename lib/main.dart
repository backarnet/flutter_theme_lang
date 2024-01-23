import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:theme_lang/cubit/locale_cubit.dart';
import 'package:theme_lang/cubit/theme_cubit.dart';

import 'pages/home_page.dart';

const appTitle = 'تجريب';
late AppLocalizations locale;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()..getLocaleCode()),
        BlocProvider(create: (_) => ThemeCubit()..getThemeIndex()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (_, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (_, localeState) {
              return MaterialApp(
                theme: themeState.themeData,
                debugShowCheckedModeBanner: false,
                title: appTitle,
                supportedLocales: const [Locale('en'), Locale('ar')],
                locale: localeState.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const HomePage(),
              );
            },
          );
        },
      ),
    );
  }
}
