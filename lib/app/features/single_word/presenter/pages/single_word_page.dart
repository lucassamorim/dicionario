import 'package:flutter/material.dart';
import 'package:dicionario/app/injector.dart';

import '../../domain/entities/word_details_entity.dart';
import '../widgets/player_widget.dart';
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
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Word:',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              state.data.word,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      if (state.data.phonetics.isNotEmpty)
                        ...state.data.phonetics.map(
                          (phonetic) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color:
                                    CustomColors.of(context).backgroundPrimary,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black12, width: 2)),
                            child: Column(
                              children: [
                                if (phonetic.text.isNotEmpty)
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('Text: '),
                                        const SizedBox(width: 5),
                                        Text(phonetic.text),
                                      ],
                                    ),
                                  ),
                                if (phonetic.audio.isNotEmpty)
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: PlayerWidget(
                                      url: phonetic.audio,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                      if (state.data.meanings.isNotEmpty)
                        ...state.data.meanings.map(
                          (meaning) => Container(
                            width: 400,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: CustomColors.of(context).backgroundPrimary,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black12, width: 2),
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                if (meaning.partOfSpeech.isNotEmpty)
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      meaning.partOfSpeech,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ),
                                if (meaning.definitions.isNotEmpty)
                                  ...meaning.definitions.map(
                                    (definition) => Column(
                                      children: [
                                        Text(
                                          definition.definition,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
