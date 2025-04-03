import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/colors.dart';
import '../manager/login_view_model.dart';
import '../widgets/login_end.dart';
import '../widgets/recipe_elevated_button.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.vm});

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.beigeColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            localization.login,
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 150),
          children: [
            Form(
              key: vm.formKey,
              child: Column(
                children: [
                  RecipeTextField(
                    title: localization.email,
                    text: "exmple@example.com",
                    validator: (value) => null,
                    controller: vm.loginController,
                  ),
                  SizedBox(height: 9),
                  RecipePasswordFormField(
                    controller: vm.passwordController,
                    validator: (value) => null,
                  ),
                ],
              ),
            ),
            if (vm.hasError)
              Text(
                vm.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            SizedBox(height: 90),
            RecipeElevatedButton(
              text: localization.logIn,
              callback: () async {
                if (vm.formKey.currentState!.validate()) {
                  if (await vm.login() && context.mounted) {
                    context.go(Routes.home);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Muvofiyaqatli tugatildi',
                        ),
                      ),
                    );
                  }
                }
              },
              fontSize: 20,
            ),
            SizedBox(height: 27),
            RecipeElevatedButton(
              text: localization.signUp,
              callback: () {
                context.go('/signup');
              },
              fontSize: 20,
            ),
            SizedBox(height: 58),
            LoginEnd()
          ],
        ),
      ),
    );
  }
}
