import '../../core/client.dart';
import '../models/following_model/following_model.dart';

class FollowingRepository {
  late final ApiClient client;
  List<FollowingModel> model = [];

  FollowingRepository({
    required this.client,
  });

  Future<List<FollowingModel>> fetchNotifications() async {
    var rawNotifications = await client.genericGetRequest<List<dynamic>>('/following/list');
    model = rawNotifications.map((e) => FollowingModel.fromJson(e)).toList();
    return model;
  }

  fetchFollowingUsers() {}
// Future<List<FollowingModel>> fetchFollowingUsers() async {
//   await Future.delayed(Duration(seconds: 1)); // Simulating network delay
//   return [
//     FollowingModel(
//         id: '1',
//         username: '@neil_tran',
//         firstName: 'Neil',
//         lastName: 'Tran',
//         profilePhoto: 'https://example.com/neil.jpg'),
//     FollowingModel(
//         id: '2',
//         username: '@chef_emily',
//         firstName: 'Emily',
//         lastName: 'Carter',
//         profilePhoto: 'https://example.com/emily.jpg'),
//   ];
// }
}
