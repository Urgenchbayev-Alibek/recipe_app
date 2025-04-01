import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/features/community/presentation/manager/community_cubit.dart';
import 'package:recipe_app/features/community/presentation/pages/community_view.dart';
import 'package:recipe_app/features/notification/presentation/manager/notifications_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews/reviews_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/pages/create_review_view.dart';
import 'package:recipe_app/features/reviews/presentation/pages/review_view.dart';
import 'package:recipe_app/features/top_chefs/presentation/pages/top_chefs_view.dart';
import 'package:recipe_app/features/your_recipes/presentation/manager/your_recipes_bloc.dart';
// import 'package:recipe_app/features/your_recipes/presentation/pages/your_recipes_view.dart';
import 'package:recipe_app/main.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/notification_repository.dart';
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
import '../../features/your_recipes/presentation/pages/your_recipe_view.dart';
import '../client.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.recipeCreate,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(create: (context) => HomeBloc(catRepo: context.read(), recipeRepo: context.read(), chefRepo: context.read()), child: HomeView()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation), child: child);
        },
      ),
    ),

    GoRoute(
      path: Routes.welcome,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: WelcomeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
            child: ScaleTransition(scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation), child: child),
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: LoginView(vm: LoginViewModel(repo: AuthRepository(client: ApiClient()))),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),

    GoRoute(
      path: Routes.signup,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: SignUpView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(turns: Tween<double>(begin: 0.8, end: 1.0).animate(animation), child: child);
        },
      ),
    ),

    GoRoute(
      path: Routes.completeProfile,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const CompleteProfileView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(
            turns: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.onboarding,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: OnboardingView(
          vm: OnboardingViewModel(
            repo: OnboardingRepository(
              client: context.read(),
            ),
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.8,
                end: 1.0,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.community,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => CommunityCubit(recipeRepo: context.read()),
          child: CommunityView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.categories,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => CategoriesBloc(catRepo: context.read()),
          child: CategoriesView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.categoryDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => CategoryDetailBloc(
            catRepo: context.read(),
            recipeRepo: context.read(),
            selectedId: int.parse(state.pathParameters['categoryId']!),
          ),
          child: CategoryDetailView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.recipeDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: ChangeNotifierProvider(
          create: (context) => RecipeDetailViewModel(
            recipeRepo: context.read(),
            recipeId: int.parse(state.pathParameters['recipeId']!),
          ),
          child: RecipeDetailView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.reviews,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => ReviewsBloc(
            recipeRepo: context.read(),
            recipeId: int.parse(state.pathParameters['recipeId']!),
          ),
          child: ReviewsView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.createReview,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => CreateReviewBloc(
            recipeRepo: context.read(),
            reviewRepo: context.read(),
          )..add(CreateReviewLoading(
              recipeId: int.parse(state.pathParameters['recipeId']!),
            )),
          child: CreateReviewView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.topChefs,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => TopChefsBloc(chefRepo: context.read()),
          child: TopChefsView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.trendingRecipe,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => TrendingRecipeBloc(trendRepo: context.read()),
          child: TrendingRecipeView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.notification,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => NotificationsBloc(
            repo: NotificationsRepository(client: ApiClient()),
          ),
          child: NotificationsView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),

    GoRoute(
      path: Routes.yourRecipes,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => YourRecipeBloc(repo: context.read()),
          child: YourRecipeView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),

    // GoRoute(path: Routes.recipeCreate, builder: (context, state) => RecipeCreateView())
    // GoRoute(
    //   path: Routes.following,
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => FollowingBloc(
    //       repository: FollowingRepository(
    //         client: ApiClient(),
    //       ),
    //     ),
    //     child: FollowingView(),
    //   ),
    // ),
  ],
);
