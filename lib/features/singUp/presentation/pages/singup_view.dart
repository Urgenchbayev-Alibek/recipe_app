import 'package:flutter/material.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/singUp//data/repositories/auth_repository.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/singUp_view_model.dart';
import '../widgets/recipe_data_of_birth_field.dart';
import '../widgets/recipe_elevated_button.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_field.dart';
import 'package:provider/provider.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingUpViewModel(
        authRepo: AuthRepository(client: ApiClient()),
      ),
      builder: (context, child) {
        final vm = context.read<SingUpViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Sing Up',
              style: TextStyle(
                color: AppColors.ReddishPink,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.only(bottom: 50),
            children:[ Form(
              key: vm.formKey,
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: 40),
                  RecipeTextField(
                    text: 'John Deo',
                    validator: (value) => null,
                    controller: vm.firstNameController,
                    title: "First Name",
                  ),
                  RecipeTextField(
                    text: 'Deo John',
                    validator: (value) => null,
                    controller: vm.lastNameController,
                    title: 'Last Name',
                  ),
                  RecipeTextField(
                    text: 'chef-birnima',
                    validator: (value) => null,
                    controller: vm.userNameController,
                    title: 'UserName',
                  ),
                  RecipeTextField(
                    text: "example@example.com",
                    validator: (value) => null,
                    controller: vm.emailController,
                    title: 'Email',
                  ),
                  RecipeTextField(
                    text: '+ 123 456 789',
                    validator: (value) => null,
                    controller: vm.phoneNumberController,
                    title: 'Phone Number',
                  ),
                  RecipeDataOfBirthField(),
                  RecipePasswordFormField(
                    controller: vm.passwordController,
                    validator: (value) => null,
                  ),
                  RecipePasswordFormField(
                      controller: vm.confirmPasswordController,
                      validator: (value) {
                      if (vm.confirmPasswordController.text != vm.passwordController.text) {
                          return "Kiritilgan parol bir-xil bo'lishi shart";
                        }
                        return null;
                      }),
                  SizedBox(height: 30),
                  Text(
                    textAlign: TextAlign.center,
                    "By continuing, you agree to\nTerms of Use and Privacy Policy.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  RecipeElevatedButton(

                    text: "Sing Up",
                    size: Size(195, 45),
                    foregroundColor: Colors.white,
                    backgraundColor: AppColors.ReddishPink,
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
                                      'Sign up succesful!',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
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
                    textAlign: TextAlign.center,
                    "Already have an account?  Log In",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ]
          ),
        );
      },
    );
  }
}
