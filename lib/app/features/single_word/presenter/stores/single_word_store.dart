import 'package:dicionario/app/features/single_word/domain/entities/word_details_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/states/base_state.dart';
import '../../domain/repositories/word_repository.dart';

class SingleWordStore extends ValueNotifier<BaseState> {
  final WordRepository repository;
  SingleWordStore({
    required this.repository,
  }) : super(InitialState());

  Future fetchWork(String word) async {
    value = LoadingState();

    final response = await repository.fetchWord(word);

    response.fold(
      (l) => value = ErrorState(exception: l),
      (r) => value = SuccessState<WordDetailsEntity>(data: r),
    );
  }
}
