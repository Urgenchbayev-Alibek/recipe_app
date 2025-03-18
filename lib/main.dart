import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/dependencies.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/core/utils/theme.dart';
import 'core/routing/router.dart';
import 'data/models/localization_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        AppSizes.init(context);
        return MaterialApp.router(
          theme: darkTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: GoRoutes.router,
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
        );
      },
    );
  }
}
