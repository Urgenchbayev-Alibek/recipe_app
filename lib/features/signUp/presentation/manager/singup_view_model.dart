import 'package:flutter/material.dart';
import 'package:recipe_app/data/repositories/auth_repository.dart' show AuthRepository;


class SingUpViewModel extends ChangeNotifier {
  SingUpViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;

  final AuthRepository _authRepo;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  set selectedDate(DateTime? value) {
    _selectedDate = value ?? _selectedDate;
    notifyListeners();
  }

  Future<bool> singUp() async => await _authRepo.singUp(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      userName: userNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      dateOfBirth: selectedDate!,
      password: passwordController.text,
    );
}
