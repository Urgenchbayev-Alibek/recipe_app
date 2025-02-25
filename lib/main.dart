import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/core/utils/theme.dart';
import 'package:recipe_app/core/client.dart';
import 'core/go_route.dart';
import 'features/signUp/data/models/localization_view_model.dart';
import 'features/signUp/data/repositories/auth_repository.dart';
import 'features/signUp/presentation/manager/singUp_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalizationViewModel()),
        ChangeNotifierProvider(
          create: (_) => SingUpViewModel(
            authRepo: AuthRepository(client: ApiClient()),
          ),
        ),
      ],
      child: const RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp.router(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: GoRoutes.router,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('uz'),
      ],
      locale: context.watch<LocalizationViewModel>().currentLocale,
    );
  }
}
