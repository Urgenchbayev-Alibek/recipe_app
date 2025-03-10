import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/repositories/recipe_repository.dart';
import '../data/repositories/top_chef_repository.dart';
import '../features/categories/data/repositories/categories_repository.dart';
import '../features/profile/data/repositories/profile_repository.dart';
import '../features/signUp/data/models/localization_view_model.dart';
import '../features/signUp/data/repositories/auth_repository.dart';
import '../features/signUp/presentation/manager/singUp_view_model.dart';
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
  Provider(create: (context) => ProfileRepository(client: context.read())),
  ChangeNotifierProvider(create: (_) => LocalizationViewModel()),
  ChangeNotifierProvider(create: (_) => SingUpViewModel(authRepo: AuthRepository(client: ApiClient()))),
  Provider(create: (context) => ChefRepository(client: context.read())),
];
