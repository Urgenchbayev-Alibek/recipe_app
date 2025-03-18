class Routes {
  static const home = '/';
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const profile = '/profile';
  static const chefProfile = '/user:/userId';
  static const completeProfile = '/completeProfile';
  static const onboardingEnd = ' /onboarding_end';
  static const categories = '/categories';
  static const String categoryDetail = '/category-detail';
  static const signup = '/signup';
  static const recipeDetail = '/recipe-detail/:recipeId';
  static const community = '/recipe/community';
  static const reviews = '/reviews/:recipeId';
  static const createReview = '/create-review/:recipeId';
  static String getRecipeDetail(int recipeId) => '/recipe-detail/$recipeId';
  static String getCategoryDetail(int categoryId) => '/category-detail/$categoryId';
  static String getReviews(int recipeId) => '/reviews/$recipeId';
  static String getCreateReview(int recipeId) => '/create-review/$recipeId';
  static String getChefProfile(int id) => '/user/$id';
}
