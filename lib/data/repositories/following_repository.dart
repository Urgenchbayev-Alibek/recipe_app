import '../models/following_model.dart';

class UserRepository {
  Future<List<UserModel>> fetchFollowingUsers() async {
    await Future.delayed(Duration(seconds: 1)); // Simulating network delay
    return [
      UserModel(
          id: '1',
          username: '@neil_tran',
          firstName: 'Neil',
          lastName: 'Tran',
          profilePhoto: 'https://example.com/neil.jpg'),
      UserModel(
          id: '2',
          username: '@chef_emily',
          firstName: 'Emily',
          lastName: 'Carter',
          profilePhoto: 'https://example.com/emily.jpg'),
    ];
  }
}