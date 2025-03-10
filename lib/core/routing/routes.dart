class Routes{
  static const home = '/';
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const profile = '/profile';
  static const completeProfile = '/completeProfile';
  static const onboardingEnd =' /onboarding_end';
  static const  categories = '/categories';
  static const String categoryDetail = '/category-detail';
  static const signup = '/signup';
  static const recipeDetail = '/recipe-detail/:recipeId';
  static const community = '/recipe/community';

  static String getCategoryDetail(int categoryId) => '/category-detail/$categoryId';
}