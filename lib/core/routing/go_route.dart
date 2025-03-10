import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/home/presentation/manager/home_view_model.dart';
import 'package:recipe_app/features/home/presentation/pages/home_view.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';

import '../../features/categories/data/models/categories_model.dart';
import '../../features/categories/data/repositories/categories_repository.dart';
import '../../features/categories/presentation/manager/categories_view_model.dart';
import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/category_detail/data/repositories/recipe_repository.dart' show RecipeRepository;
import '../../features/category_detail/presentation/manager/category_detail_view_model.dart';
import '../../features/category_detail/presentation/pages/category_detail_view.dart';
import '../../features/community/data/repositories/community_repository.dart';
import '../../features/community/presentation/manager/community_view_model.dart';
import '../../features/community/presentation/pages/community_view.dart';
import '../../features/onboarding/data/repositories/onboarding_repository.dart';
import '../../features/onboarding/presentation/manager/onboarding_view_model.dart';
import '../../features/onboarding/presentation/pages/onboarding_end.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/data/repositories/profile_repository.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/profile_view_model.dart';
import '../../features/recipe_detail/presentation/pages/recipe_detail_view.dart';
import '../../features/signUp/data/repositories/auth_repository.dart';
import '../../features/signUp/presentation/manager/login_view_model.dart';
import '../../features/signUp/presentation/pages/complete_profile_view.dart';
import '../../features/signUp/presentation/pages/login_view.dart';
import '../../features/signUp/presentation/pages/singup_view.dart';
import '../client.dart';

class GoRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.community,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: Routes.signup,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => ProfilePage(
          vm: ProfileViewModel(
            recipeRepo: RecipeRepository(client: ApiClient()),
            profileRepo: ProfileRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.completeProfile,
        builder: (context, state) => const CompleteProfileView(),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => OnboardingPage(
          ovm: OnBoardingViewModel(
            repo: OnBoardingRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.onboardingEnd,
        builder: (context, state) => OnboardingEnd(
          pvm: ProfileViewModel(
            recipeRepo: RecipeRepository(client: context.read()),
            profileRepo: ProfileRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.categoryDetail,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => CategoryDetailViewModel(
            catRepo: context.read(),
            recipeRepo: context.read(),
            selected: state.extra as CategoryModel,
          )..load(),
          child: CategoryDetailView(),
        ),
      ),
      GoRoute(
        path: Routes.categories,
        builder: (context, state) => CategoriesPage(
          cvm: CategoriesViewModel(
            repo: CategoryRepository(client: ApiClient()),
          ),
        ),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginView(
          vm: LoginViewModel(repo: AuthRepository(client: ApiClient())),
        ),
      ),
      GoRoute(
        path: '${Routes.recipeDetail}/:recipeId',
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => RecipeDetailViewModel(
            recipeRepo: context.read(),
            recipeId: int.parse(state.pathParameters['recipeId']!),
          ),
          child: RecipeDetailView(),
        ),
      ),
      GoRoute(
        path: Routes.community,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => CommunityViewModel(
            comRepo: context.read<CommunityRepository>(),
            order: "date",
            limit: 10,
            descending: true,
          ),
          child: CommunityView(),
        ),
      ),
    ],
  );
}
