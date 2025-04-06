import '../../core/client.dart';
import '../models/profile_model.dart';
import '../models/recipe/recipe_model.dart';
import '../models/top_chef_model.dart';

class ProfileRepository {
  final ApiClient client;

  ProfileRepository({required this.client});

  List<RecipeModel> myRecipes = [];
  ProfileModel? aboutUser;
  List<TopChefModel> followers=[];
  List<TopChefModel> followings=[];



  Future<ProfileModel> fetchUserInfo(int userId) async {
    var rawUser = await client.genericGetRequest("/auth/details/$userId");
    aboutUser = ProfileModel.fromJson(rawUser);
    return aboutUser!;
  }

  Future<List<RecipeModel>> fetchProfileRecipes(int userId) async {
    var rawRecipes = await client.fetchRecipes(userId);
    myRecipes = rawRecipes.map((e) => RecipeModel.fromJson(e)).toList();
    return myRecipes;
  }
  Future<List<TopChefModel>>fetchFollowers(int id)async{
    final rawFollower=await client.fetchFollowers(id);
    followers=rawFollower.map((e)=>TopChefModel.fromJson(e)).toList();
    return followers;
  }
  Future<List<TopChefModel>>fetchFollowings(int id)async{
    final rawFollowings=await client.fetchFollowings(id);
    followings=rawFollowings.map((e)=>TopChefModel.fromJson(e)).toList();
    return followings;

  }
  Future<int> fetchFollowUser(int userId) async {
    final followUser = await client.fetchFollowId(userId);
    return followUser;
  }
  Future<int> fetchUnFollowUser(int userId) async {
    final unfollowUser = await client.fetchUnFollowId(userId);
    return unfollowUser;
  }
  Future<int> fetchDeleteUser(int userId) async {
    final delete = await client.fetchDeleteId(userId);
    return delete;
  }

}
