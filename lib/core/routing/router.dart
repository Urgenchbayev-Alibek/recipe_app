import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/data/repositories/profile_repository.dart';
import 'package:recipe_app/features/community/presentation/manager/community_cubit.dart';
import 'package:recipe_app/features/community/presentation/pages/community_view.dart';
import 'package:recipe_app/features/notification/presentation/manager/notifications_bloc.dart';
import 'package:recipe_app/features/profile/presentation/pages/profile_page.dart';
import 'package:recipe_app/features/profile/presentation/pages/profile_view_model.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews/reviews_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/pages/create_review_view.dart';
import 'package:recipe_app/features/reviews/presentation/pages/review_view.dart';
import 'package:recipe_app/features/top_chefs/presentation/pages/top_chefs_view.dart';
import 'package:recipe_app/main.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/notification_repository.dart';
import '../../data/repositories/recipe_repository.dart';
import '../../features/auth/presentation/manager/login_view_model.dart';
import '../../features/auth/presentation/pages/complete_profile_view.dart';
import '../../features/auth/presentation/pages/login_view.dart';
import '../../features/auth/presentation/pages/singup_view.dart';
import '../../features/categories/presentation/manager/categories_cubit.dart';
import '../../features/categories/presentation/pages/categories_view.dart';
import '../../features/category_detail/presentation/manager/category_detail_view_model.dart';
import '../../features/category_detail/presentation/pages/category_detail_view.dart';
import '../../features/home/presentation/manager/home_view_model.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/notification/presentation/pages/notification_view.dart';
import '../../features/onboarding/presentation/managers/onboarding_view_model.dart';
import '../../features/onboarding/presentation/pages/onboarding_view.dart';
import '../../features/onboarding/presentation/pages/welcome_view.dart';
import '../../features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import '../../features/recipe_detail/presentation/pages/recipe_detail_view.dart';
import '../../features/top_chefs/presentation/manager/top_chef/top_chefs_bloc.dart';
import '../../features/trending_recipe/presentation/manager/trending_recipe_bloc.dart';
import '../../features/trending_recipe/presentation/pages/trending_recipe_view.dart';
import '../client.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.notification,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          catRepo: context.read(),
          recipeRepo: context.read(),
          chefRepo: context.read(),
        ),
        child: HomeView(),
      ),
    ),
    GoRoute(
      path: Routes.welcome,
      builder: (context, state) => WelcomeView(),
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
      path: Routes.login,
      builder: (context, state) => LoginView(
        vm: LoginViewModel(repo: AuthRepository(client: ApiClient())),
      ),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: Routes.completeProfile,
      builder: (context, state) => const CompleteProfileView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(
        vm: OnboardingViewModel(
          repo: OnboardingRepository(client: context.read()),
        ),
      ),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => BlocProvider(
        create: (context) => CommunityCubit(recipeRepo: context.read()),
        child: CommunityView(),
      ),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoriesBloc(catRepo: context.read()),
        child: CategoriesView(),
      ),
    ),
    GoRoute(
      path: Routes.categoryDetail,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoryDetailBloc(
          catRepo: context.read(),
          recipeRepo: context.read(),
          selectedId: int.parse(state.pathParameters['categoryId']!),
        ),
        child: CategoryDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeDetailViewModel(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: RecipeDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewsBloc(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: ReviewsView(),
      ),
    ),
    GoRoute(
      path: Routes.createReview,
      builder: (context, state) => BlocProvider(
        /**/
        create: (context) => CreateReviewBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
        )..add(CreateReviewLoading(recipeId: int.parse(state.pathParameters['recipeId']!))),
        child: CreateReviewView(),
      ),
    ),
    GoRoute(
      path: Routes.topChefs,
      builder: (context, state) => BlocProvider(
        create: (context) => TopChefsBloc(
          chefRepo: context.read(),
        ),
        child: TopChefsView(),
      ),
    ),
    GoRoute(
      path: Routes.trendingRecipe,
      builder: (context, state) => BlocProvider(
        create: (context) => TrendingRecipeBloc(
          trendRepo: context.read(),
        ),
        child: TrendingRecipeView(),
      ),
    ),
    GoRoute(path: R)
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => BlocProvider(
        create: (context) => NotificationsBloc(
          repo: NotificationsRepository(
            client: ApiClient(),
          ),
        ),
        child: NotificationsView(),
      ),
    ),
  ],
);
