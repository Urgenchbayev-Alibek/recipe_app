import '../../core/client.dart';
import '../models/top_chef_model_small.dart';

class ChefRepository {
  ChefRepository({required this.client});

  final ApiClient client;

  List<TopChefModelSmall> topChefs = [];

  Future<List<TopChefModelSmall>> fetchTopChefsForHome({int? limit}) async {
    var rawChefs = await client.fetchTopChefsForHome(limit: limit);
    topChefs = rawChefs.map((chef) => TopChefModelSmall.fromJson(chef)).toList();
    return topChefs;
  }
}