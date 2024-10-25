import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/settings_cubit/setting_cubit.dart';
import 'package:news_app/splash/splash_screen.dart';
import 'package:news_app/ui/home/articals_details/articals_details.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/core/theme/my_theme_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingCubit = SettingCubit();
  await settingCubit.getLang();
  runApp(BlocProvider(create: (_) => settingCubit, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<SettingProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: context.watch<SettingCubit>().state,
      initialRoute: SplashScreen.routeName,
      theme: AppTheme.appTheme,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ArticalDetails.routeName: (_) => const ArticalDetails(),
      },
    );
  }
}
