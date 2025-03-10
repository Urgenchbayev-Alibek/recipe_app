import 'package:recipe_app/core/client.dart';

import '../models/top_chef_model_small.dart';

class ChefRepository {
  ChefRepository({required this.client});

  final ApiClient client;

  List<TopChefModelSmall> topChefs = [];

  Future<List<TopChefModelSmall>> fetchTopChefs({int? limit}) async {
    if (topChefs.isNotEmpty) return topChefs;

    var rawChefs = await client.fetchTopChefs(limit:limit);
    topChefs = rawChefs.map((chef) => TopChefModelSmall.fromJson(chef)).toList();
    return topChefs;
  }
}
