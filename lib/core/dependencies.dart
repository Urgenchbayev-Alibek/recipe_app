import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe_app/data/repositories/auth_repository.dart';
import 'package:recipe_app/data/repositories/onboarding_repository.dart';

import '../data/models/localization_view_model.dart';
import '../data/repositories/category_repository.dart';
import '../data/repositories/chef_repository.dart';
import '../data/repositories/profile_repository.dart';
import '../data/repositories/recipe_repository.dart';
import '../data/repositories/review_repository.dart';
import '../data/repositories/trending-recipes_repository.dart';
import '../features/auth/presentation/manager/singUp_view_model.dart';
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  ),
  Provider(
    create: (context) => RecipeRepository(client: context.read()),
  ),
  Provider(
    create: (context) => ChefRepository(client: context.read()),
  ),
  Provider(
    create: (context) => ReviewRepository(client: context.read()),
  ),
  Provider(
    create: (context) => AuthRepository(client: context.read()),
  ),
  Provider(
    create: (context) => OnboardingRepository(client: context.read()),
  ),
  Provider(create: (context) => ProfileRepository(client: context.read())),
  ChangeNotifierProvider(create: (_) => LocalizationViewModel()),
  ChangeNotifierProvider(create: (_) => SingUpViewModel(authRepo: AuthRepository(client: ApiClient()))),
  Provider(
    create: (context) => TrendingRecipesRepository(
      client: context.read(),
    ),
  ),
];
