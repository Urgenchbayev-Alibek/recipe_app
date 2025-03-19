import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews/reviews_state.dart';

import '../../../../../data/repositories/recipe_repository.dart';

part 'reviews_event.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final RecipeRepository _recipeRepo;

  ReviewsBloc({required RecipeRepository recipeRepo, required int recipeId})
      : _recipeRepo = recipeRepo,
        super(ReviewsState.initialize()) {
    on<ReviewsLoading>(_load);
    add(ReviewsLoading(recipeId: recipeId));
  }

  Future _load(ReviewsLoading event, Emitter emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchRecipeForReviews(event.recipeId);
    final comments = await _recipeRepo.fetchComments(event.recipeId);
    emit(ReviewsState(recipeModel: recipe, status: ReviewsStatus.idle, comments: comments, reviews: [] ));
  }

  static String sinceCreated({required String createdText}) {
    DateTime now = DateTime.now();
    DateTime created = DateTime.parse(createdText);
    Duration diff = now.difference(created);
    if (diff.inDays >= 365) return "${(diff.inDays / 365).floor()} year${(diff.inDays / 365).floor() == 1 ? '' : 's'} ago";
    if (diff.inDays >= 30) return "${(diff.inDays / 30).floor()} month${(diff.inDays / 30).floor() == 1 ? '' : 's'} ago";
    if (diff.inDays >= 1) return "${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago";
    if (diff.inHours >= 1) return "${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago";
    if (diff.inMinutes >= 1) return "${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago";
    return "${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago";
  }

  // Future showComment(ReviewsShowAllComment event, Emitter emit) async {
  //   emit(state.copyWith());
  // }
}
