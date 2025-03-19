import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/community/presentation/manager/community_cubit.dart';
import 'package:recipe_app/features/community/presentation/pages/community_view.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews/reviews_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/pages/create_review_view.dart';
import 'package:recipe_app/features/reviews/presentation/pages/review_view.dart';
import '../../features/categories/presentation/manager/categories_cubit.dart';
import '../../features/categories/presentation/pages/categories_view.dart';
import '../../features/category_detail/presentation/manager/category_detail_view_model.dart';
import '../../features/category_detail/presentation/pages/category_detail_view.dart';
import '../../features/home/presentation/manager/home_view_model.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import '../../features/recipe_detail/presentation/pages/recipe_detail_view.dart';


final router = GoRouter(
  initialLocation: Routes.getCreateReview(3),
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
        create: (context) => CreateReviewBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
        )..add(CreateReviewLoading(recipeId: int.parse(state.pathParameters['recipeId']!))),
        child: CreateReviewView(),
      ),
    ),
  ],
);