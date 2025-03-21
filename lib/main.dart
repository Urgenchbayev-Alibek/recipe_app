import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import 'core/dependencies.dart';
import 'core/routing/router.dart';
import 'core/utils/themes.dart';
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
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return MultiProvider(
      providers: providers,
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: AppThemes.darkTheme,
      ),
    );
  }
}