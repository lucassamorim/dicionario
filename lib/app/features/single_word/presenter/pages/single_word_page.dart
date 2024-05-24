import 'package:dicionario/app/core/errors/default_exception.dart';
import 'package:dicionario/app/features/single_word/domain/entities/word_details_entity.dart';
import 'package:flutter/material.dart';

import 'package:dicionario/app/injector.dart';

import '../../../../core/states/base_state.dart';
import '../../../../desing_system/theme/theme.dart';
import '../stores/single_word_store.dart';

class SingleWordPage extends StatefulWidget {
  final String word;
  const SingleWordPage({
    super.key,
    required this.word,
  });

  @override
  State<SingleWordPage> createState() => _SingleWordPageState();
}

class _SingleWordPageState extends State<SingleWordPage> {
  final store = injector.get<SingleWordStore>();

  @override
  void initState() {
    store.fetchWork(widget.word);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book_rounded,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 5),
            Text(
              "Detalhes da palavra",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        backgroundColor: CustomColors.of(context).backgroundSecondary,
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, state, child) {
          if (state is ErrorState) {
            print(state.exception.message);
          }
          print(state);
          if (state is LoadingState) {
            return const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is SuccessState<WordDetailsEntity>) {
            return Column(
              children: [
                Row(
                  children: [
                    Text('Word:'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(state.data.word)
                  ],
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
