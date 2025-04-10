import 'dart:io';

import 'package:dio/dio.dart';
import 'package:recipe_app/core/interceptor.dart';

import '../data/models/create_review_model.dart';
import '../data/models/recipe_create_model.dart';
import '../data/models/user_model.dart';
import 'exceptions/auth_exception.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(baseUrl:'http://100.65.185.180:8888/api/v1', validateStatus: (status) => true),
    );
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<String> login({required String login, required String password}) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!.toString();
    } else {
      throw AuthException(message: "Login qilib bo'madi, xullasi nimadur noto'g'ri ketgan.");
    }
  }

  Future<Map<String, dynamic>> signUp({required UserModel model}) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    if (response.statusCode == 201) {
      String token = response.data["accessToken"];
      return {
        "result": true,
        "token": token,
      };
    } else {
      return {
        "result": true,
        "token": null,
      };
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap(
      {"profilePhoto": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last)},
    );

    var response = await dio.patch(
      '/auth/upload',
      data: formData,
      options: Options(
        headers: {"Content-Type": "multipart/form-data"},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get("/onboarding/list");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("Failed to load onboarding pages");
    }
  }

  Future<Map<String, dynamic>> fetchMyProfile() async {
    var response = await dio.get('/auth/me');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw AuthException(message: "Xullas muammo, katta muammo!");
    }
  }

  Future<T> genericGetRequest<T>(String path, {Map<String, dynamic>? queryParams}) async {
    var response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(requestOptions: response.requestOptions, response: response);
    }
  }

  Future<bool> recipeCreate(RecipeCreateModel model) async {
    try {
      final formData = FormData.fromMap(await model.toJson());
      final response = await dio.post(
        '/recipes/create',
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVtaWx5QGdtYWlsLmNvbSIsImp0aSI6Ijg3MTUxYTRlLTViMmYtNGViYy1hYmU4LTQzZmExYzM2YzZlNSIsInVzZXJpZCI6IjUiLCJleHAiOjE4MzY5MTc5MjcsImlzcyI6ImxvY2FsaG9zdCIsImF1ZCI6ImF1ZGllbmNlIn0.UY2a5qRKT2dUfNq6BsBT6rvxQg-medYeEoAb24fPSG0",
          },
        ),
        data: formData,
      );
      return response.statusCode == 201;
    } catch (e) {
      print("Error creating recipe: $e");
      return false;
    }
  }

  Future<bool> createReview(CreateReviewModel model) async {
    final formData = FormData.fromMap(await model.toJson());
    final response = await dio.post(
      '/reviews/create',
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVtaWx5QGdtYWlsLmNvbSIsImp0aSI6Ijg3MTUxYTRlLTViMmYtNGViYy1hYmU4LTQzZmExYzM2YzZlNSIsInVzZXJpZCI6IjUiLCJleHAiOjE4MzY5MTc5MjcsImlzcyI6ImxvY2FsaG9zdCIsImF1ZCI6ImF1ZGllbmNlIn0.UY2a5qRKT2dUfNq6BsBT6rvxQg-medYeEoAb24fPSG0",
        },
      ),
      data: formData,
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> fetchChefProfileById(int userId) async {
    var response = await dio.get("/auth/details/$userId");
    Map<String, dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipes(int userId) async {
    var response = await dio.get('/recipes/list?UserId=$userId');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }
    throw Exception("xato bor recipe kelishida");
  }

  Future<List<dynamic>>fetchFollowers(int id)async{
    final response=await dio.get('/auth/followers/$id');
    if (response.statusCode==200){
      return List.from(response.data);
    }else{
      throw Exception('followers xato ketdi');
    }
  }

  Future<List<dynamic>> fetchFollowings(int id) async {
    final response = await dio.get('/auth/followings/$id');
    if (response.statusCode == 200) {
      return List.from(response.data);
    } else {
      throw Exception('followings xato ketdi');
    }
  }

  Future<List<dynamic>> fetchMyRecipes([int? limit]) async {
    var response = await dio.get("/recipes/my-recipes?Limit=${limit ?? ""}");
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/categories/list so'rovimiz o'xshamadi!");
    }
  }

  Future<List<dynamic>> fetchRecipesByCategory(int categoryId) async {
    var response = await dio.get('/recipes/list', queryParameters: {"Category": categoryId});
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/list?Category=$categoryId so'rovimiz o'xshamadi");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception("/recipes/detail/$recipeId so'rovimiz xato ketti");
    }
  }

  Future<dynamic> fetchTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("/recipes/trending-recipe so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchYourRecipes({int? limit}) async {
    var response = await dio.get('/recipes/list?Order=title&Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/recipes/list?Limit=2 so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchTopChefs({int? limit}) async {
    var response = await dio.get('/auth/top-chefs?Limit=${limit ?? ''}');
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchCommunityRecipes({required String orderBy, required bool descending}) async {
    var response = await dio.get('/recipes/community/list?Order=$orderBy&Descending=$descending');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/community/list so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchTopChefsForHome({int? limit}) async {
    final response = await dio.get('/auth/top-chefs?Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/auth/top-chefs?Limit=${limit ?? ''} so'rovimiz xato ketti");
    }
  }

  Future<List<dynamic>> fetchRecentlyAddedRecipes({int? limit}) async {
    final response = await dio.get('/recipes/list?Order=date&Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/list?Order=date&Limit=${limit ?? ''} so'rovimiz xato ketti!");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeForReviews(int recipeId) async {
    var response = await dio.get('/recipes/reviews/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("recipes/reviews/detail/$recipeId so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchRecipeComments(int recipeId) async {
    var response = await dio.get("/reviews/list?recipeId=$recipeId");
    List<dynamic> data = response.data;
    return data;
  }

  Future<int> fetchFollowId(int id) async {
    final response = await dio.post('/auth/follow/$id');

    if (response.statusCode == 200) {
      if (response.data is int) {
        return response.data;
      } else if (response.data is String) {
        return int.tryParse(response.data) ?? 0;
      } else {
        throw Exception("Noto‘g‘ri data turi: ${response.data}");
      }
    } else {
      throw Exception("Server xatosi: ${response.statusCode}");
    }
  }

  Future<int> fetchDeleteId(int id) async {
    final response = await dio.post('/auth/remove-follower/$id');

    if (response.statusCode == 200) {
      if (response.data is int) {
        return response.data;
      } else if (response.data is String) {
        return int.tryParse(response.data) ?? 0;
      } else {
        throw Exception("Noto‘g‘ri data turi: ${response.data}");
      }
    } else {
      throw Exception("Server xatosi: ${response.statusCode}");
    }
  }

  Future<int> fetchUnFollowId(int id) async {
    final response = await dio.post('/auth/unfollow/$id');

    if (response.statusCode == 200) {
      if (response.data is int) {
        return response.data;
      } else if (response.data is String) {
        return int.tryParse(response.data) ?? 0;
      } else {
        throw Exception("Noto‘g‘ri data turi: ${response.data}");
      }
    } else {
      throw Exception("Server xatosi: ${response.statusCode}");
    }
  }
}
