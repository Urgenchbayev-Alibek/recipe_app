import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/models/top_chef_profile_model.dart';

class TopChefProfileRepository {
  Future<TopChefProfile> getTopChefProfile(int chefId) async {
    final url = Uri.parse("http://localhost:8888/api/top-chefs/$chefId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return TopChefProfile.fromJson(jsonData);
    } else {
      throw Exception("Failed to load chef profile");
    }
  }
}
