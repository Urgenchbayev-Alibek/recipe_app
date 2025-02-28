import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../data/models/localization_view_model.dart';
import '../manager/singUp_view_model.dart';
import '../widgets/recipe_data_of_birth_field.dart';
import '../widgets/recipe_elevated_button.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SingUpViewModel>();
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localization.sign_up,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<LocalizationViewModel>().currentLocale = Locale("uz");
            },
            child: Text("uz"),
          ),
          TextButton(
            onPressed: () {
              context.read<LocalizationViewModel>().currentLocale = Locale("en");
            },
            child: Text("en"),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 50),
        children: [
          Form(
            key: vm.formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                RecipeTextField(
                  text: 'John Doe',
                  validator: (value) => null,
                  controller: vm.firstNameController,
                  title: localization.full_name,
                ),
                RecipeTextField(
                  text: "example@example.com",
                  validator: (value) => null,
                  controller: vm.emailController,
                  title: localization.email,
                ),
                RecipeTextField(
                  text: '+ 123 456 789',
                  validator: (value) => null,
                  controller: vm.phoneNumberController,
                  title: localization.mobile_number,
                ),
                RecipeDataOfBirthField(title: localization.date_of_birth),
                RecipePasswordFormField(
                  controller: vm.passwordController,
                  validator: (value) => null,
                ),
                RecipePasswordFormField(
                  controller: vm.confirmPasswordController,
                  validator: (value) {
                    if (vm.confirmPasswordController.text != vm.passwordController.text) {
                      return localization.confirm_password;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  localization.terms,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                RecipeElevatedButton(
                  text: localization.sign_up,
                  size: const Size(195, 45),
                  foregroundColor: Colors.white,
                  backGroundColor: AppColors.redPinkMain,
                  callback: () async {
                    if (vm.formKey.currentState!.validate()) {
                      if (await vm.singUp() && context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Container(
                              height: 286,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Sign up successful!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
                Text(
                  localization.already_have_account,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
