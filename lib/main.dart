import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/core/utils/theme.dart';
import 'package:recipe_app/features/categories/data/models/categories_model.dart';
import 'package:recipe_app/features/category_detail/data/repositories/recipe_repository.dart';
import 'core/routing/go_route.dart';
import 'features/categories/data/repositories/categories_repository.dart';
import 'features/category_detail/presentation/manager/category_detail_view_model.dart';
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
        Provider<CategoryRepository>(
          create: (_) => CategoryRepository(client: ApiClient()),
        ),
        Provider<RecipeRepository>(
          create: (_) => RecipeRepository(client: ApiClient()),
        ),
        ChangeNotifierProvider<CategoryDetailViewModel>(
          create: (context) => CategoryDetailViewModel(
            catRepo: context.read<CategoryRepository>(),
            recipeRepo: context.read<RecipeRepository>(),
            selected: CategoryModel(id: 1, title: "Seafood", image:  "http://192.168.100.59:8888/uploads/categories/seafood.png", main: true),
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
