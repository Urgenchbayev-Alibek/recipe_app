import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/data/models/top_chef_profile_model.dart';

class TopChefRepository {
  final String baseUrl = "http://localhost:8888/api/chefs";

  Future<List<TopChefProfileModel>> fetchTopChefs() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => TopChefProfileModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load top chefs");
    }
  }
}
