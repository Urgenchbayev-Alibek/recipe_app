class Routes {
  static const String home = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const onboarding = '/onboarding';
  static const welcome = '/welcome';
  static const String profile = '/profile/:userId';
  static const chefProfile = '/user:/userId';
  static const completeProfile = '/completeProfile';
  static const String categories = '/categories';
  static const String categoryDetail = '/category-detail/:categoryId'; //categoryId pathParam bilan ham ko'rsatish
  static const String recipeDetail = '/recipe-detail/:recipeId'; // /recipe-detail/20
  static const String community = '/community';
  static const String reviews = '/reviews/:recipeId';
  static const String createReview = '/create-review/:recipeId';
  static const String topChefs = '/top-chefs';
  static const String chefsProfile='/chefs_profile/:UserId';
  static const String trendingRecipe = '/trending-recipe';
  static const String notification = '/notifications/list';
  static const String yourRecipes = '/recipes/my-recipes';
  static const String follow='/follow/:id';

  static const String recipeCreate = 'recipe-create';

  static String getRecipeDetail(int recipeId) => '/recipe-detail/$recipeId';

  static String getCategoryDetail(int categoryId) => '/category-detail/$categoryId';

  static String getReviews(int recipeId) => '/reviews/$recipeId';

  static String getCreateReview(int recipeId) => '/create-review/$recipeId';

  static String getChefProfile(int id) => '/user/$id';
  static String getChefsProfile(int userId)=>'/chefs_profile/$userId';

  static String getProfile(int userId) => '/profile/$userId';

  static String getFollow(int id) => '/follow/$id';
}
