import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import '../manager/login_view_model.dart';
import '../widgets/login_ostki.dart';
import '../widgets/recipe_elevated_button.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.vm});

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.MainColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Login',
            style: TextStyle(
              color: AppColors.ReddishPink,
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
                    title: 'Email',
                    text: "exmple@example.com",
                    validator: (value) => null,
                    controller: vm.loginController,
                  ),
                  SizedBox(height: 9),
                  RecipePasswordFormField(controller: vm.passwordController, validator: (value) => null,),
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
              text: "Log In",

              callback: () async {
                if (vm.formKey.currentState!.validate()) {
                  if (await vm.login() && context.mounted) {
                    context.go('/categories');
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
              text: "Sing Up",
              callback: () {
                context.go('/singup');
              },
              fontSize: 20,
            ),
            SizedBox(height: 58),
            LoginOstki()
          ],
        ),
      ),
    );
  }
}

