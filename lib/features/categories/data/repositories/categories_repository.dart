import 'package:recipe_app/core/client.dart';
import '../models/categories_model.dart';

class CategoryRepository {
  CategoryRepository({required this.client});

  final ApiClient client;

  List<CategoryModel> categoriesModel = [];

  Future<List<CategoryModel>> fetchCategories() async {
    var rawCategories = await client.fetchCategories();

    categoriesModel =
        rawCategories.map((json) => CategoryModel.fromJson(json)).toList();

    return categoriesModel;
  }
}
