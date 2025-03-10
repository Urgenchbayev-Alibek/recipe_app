import '../../../../core/client.dart';
import '../models/community_model.dart';

class CommunityRepository {
  final ApiClient client;
  List<CommunityModel> community = [];

  CommunityRepository({
    required this.client,
  });

  Future<List<CommunityModel>> fetchCommunityRecipes(int limit, String order, bool descending) async {
    var rawCommunity = await client.fetchCommunityRecipes(limit, order, descending);
    community = rawCommunity.map((community) => CommunityModel.fromJson(community)).toList();
    return community;
  }
}
