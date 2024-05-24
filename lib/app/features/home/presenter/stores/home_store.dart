import 'package:flutter/material.dart';

import '../../../../core/states/base_state.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/entities/word_entity.dart';

class HomeStore extends ValueNotifier<BaseState> {
  final HomeRepository repository;
  HomeStore({required this.repository}) : super(InitialState());

  final word = TextEditingController();

  Future fetchWords() async {
    value = LoadingState();
    final response = await repository.fetchWords();

    response.fold(
      (l) => value = ErrorState(exception: l),
      (r) => value = SuccessState<List<WordEntity>>(data: r),
    );
  }
}
