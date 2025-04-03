import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/recipe_create_alibek/presentations/pages/recipe_create_view.dart';
import 'core/dependencies.dart';
import 'core/l10n/app_localizations.dart';
import 'core/routing/router.dart';
import 'core/sizes.dart';
import 'core/utils/themes.dart';
import 'data/models/localization_view_model.dart';
import 'features/your_recipes/presentation/pages/your_recipe_view.dart';
/*
state & behavior
state alohida bo'lib ajraladi
Cubit, state, emit
Equatable, immutable
part of, part
BlocBuilder, BlocSelector, BlocListener
BlocProvider
RepositoryProvider
*/

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // App full-screen bo'lib run bo'lishi uchun!
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return MultiProvider(
      providers: providers,
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: AppThemes.darkTheme,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('uz'),
        ],
        locale: context.watch<LocalizationViewModel>().currentLocale,
      ),
    // return MultiProvider(
    //   providers: providers,
    //   builder: (context, child) => MaterialApp.router(
    //     routerConfig: router,
    //     debugShowCheckedModeBanner: false,
    //     themeMode: ThemeMode.dark,
    //     darkTheme: AppThemes.darkTheme,
    //     localizationsDelegates: const [
    //       AppLocalizations.delegate,
    //       GlobalMaterialLocalizations.delegate,
    //       GlobalWidgetsLocalizations.delegate,
    //       GlobalCupertinoLocalizations.delegate,
    //     ],
    //     supportedLocales: const [
    //       Locale('en'),
    //       Locale('uz'),
    //     ],
    //     locale: context.watch<LocalizationViewModel>().currentLocale,
    //   ),
    // );
    return MaterialApp(
      home: RecipeCreateView()
    );
    // return MaterialApp(
    //   home: NotificationView()
    // );
  }
}

