import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review/create_review_state.dart';

part 'create_review_event.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  CreateReviewBloc()
      : super(
          CreateReviewState.initial(),
        ) {
    on<CreateReviewRate>(_onRate);
  }

  Future<void> _onRate(CreateReviewRate event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(currentIndex: event.currentIndex, status: CreateReviewStatus.idle));
  }

  Future<void> _onPickImage(CreateReviewPickImage event, Emitter<CreateReviewState> emit) async {
    File? image;
    final imagePicker = ImagePicker();
    // final pickImage=await ;
  }
}
