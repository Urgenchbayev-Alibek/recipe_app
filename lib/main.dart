import 'package:flutter/material.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/core/utils/theme.dart';

import 'core/go_route.dart';

void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp.router(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: GoRoutes.router,
    );
  }
}
