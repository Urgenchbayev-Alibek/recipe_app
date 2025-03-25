import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/dependencies.dart';
import 'core/l10n/app_localizations.dart';
import 'core/routing/router.dart';
import 'core/sizes.dart';
import 'core/utils/themes.dart';
<<<<<<< HEAD
import 'features/notification/presentation/pages/notification_vieww.dart';
=======
import 'data/models/localization_view_model.dart';
>>>>>>> 8cc75c96ec7c1135895575b11f6746a0e1b283af
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
<<<<<<< HEAD
    // return MultiProvider(
    //   providers: providers,
    //   builder: (context, child) => MaterialApp.router(
    //     routerConfig: router,
    //     debugShowCheckedModeBanner: false,
    //     themeMode: ThemeMode.dark,
    //     darkTheme: AppThemes.darkTheme,
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationView(),
=======
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
>>>>>>> 8cc75c96ec7c1135895575b11f6746a0e1b283af
    );
  }
}