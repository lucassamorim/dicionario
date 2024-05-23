import 'package:dicionario/app/core/states/base_state.dart';
import 'package:dicionario/app/desing_system/alert/alerts.dart';
import 'package:dicionario/app/features/home/domain/entities/word_entity.dart';
import 'package:dicionario/app/injector.dart';
import 'package:flutter/material.dart';

import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = injector.get<HomeStore>();

  @override
  void initState() {
    store.fetchWords();
    store.addListener(listener);
    super.initState();
  }

  void listener() {
    return switch (store.value) {
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      _ => null
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: store,
            builder: (context, state, child) {
              if (state is LoadingState) {
                return const Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is SuccessState<List<WordEntity>>) {
                return GridView.builder(
                    padding: const EdgeInsets.all(12.0),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: state.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final word = state.data[index];
                      return Container(
                        color: Colors.red,
                        child: Center(child: Text(word.word)),
                      );
                    });
              }

              return Container();
            },
          ))
        ],
      ),
    );
  }
}
