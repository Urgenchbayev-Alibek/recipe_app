import 'dart:io';

import 'package:recipe_app/data/models/user_model.dart';

import '../../core/client.dart';
import '../../core/secure_storage.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  String? jwt;

  Future<void> login(String login, String password) async {
    final String token = await client.login(login: login, password: password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.saveToken(token: token);
    jwt = token;
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String password,
  }) async {
    final result = await client.signUp(
      model: UserModel(
        firstName: firstName,
        lastName: lastName,
        userName: username,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        dateOfBirth: dateOfBirth,
      ),
    );
    if (result["result"]) {
      SecureStorage.deleteToken();
      SecureStorage.saveToken(token: result["token"]);
      SecureStorage.deleteCredentials();
      SecureStorage.saveCredentials(login: phoneNumber, password: password);
      return true;
    } else {
      return false;
    }
  }


  Future<bool> uploadProfilePhoto(File file) async {
    final result = await client.uploadProfilePhoto(file);
    return result;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials?['login'] == null || credentials?['password'] == null) {
      return false;
    } else {
      var jwt = await client.login(login: credentials!['login']!, password: credentials['password']!);
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(token: jwt);
      return true;
    }
  }
}
