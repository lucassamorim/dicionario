import 'package:flutter/material.dart';

import '../../data/usecases/fetch_word_usecase.dart';
import '../../domain/entities/word_details_entity.dart';
import '../../../../core/states/base_state.dart';

class SingleWordStore extends ValueNotifier<BaseState> {
  final FetchWordUsecase usecase;
  SingleWordStore({
    required this.usecase,
  }) : super(InitialState());

  Future fetchWork(String word) async {
    value = LoadingState();

    final response = await usecase(word);

    response.fold(
      (l) => value = ErrorState(exception: l),
      (r) => value = SuccessState<WordDetailsEntity>(data: r),
    );
  }
}
