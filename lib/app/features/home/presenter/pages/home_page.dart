
import 'package:dicionario/app/desing_system/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/states/base_state.dart';
import '../../../../desing_system/alert/alerts.dart';
import '../../../../injector.dart';
import '../../domain/entities/word_entity.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.menu_book_rounded, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 5),
            Text("Dicionário", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          ],
        ), backgroundColor: CustomColors.of(context).backgroundSecondary,),
        backgroundColor: CustomColors.of(context).backgroundPrimary,
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20), child: TextFormField( decoration: InputDecoration(label: const Text("Digite a palavra"), suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search))),),),
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
                              childAspectRatio: 3 / 1,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12),
                      itemCount: state.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final word = state.data[index];
                        return Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Theme.of(context).colorScheme.primaryContainer,),
                          child: Center(child: Text(word.word, style: const TextStyle(color: Colors.white),)),
                        );
                      });
                }
      
                return Container();
              },
            ))
          ],
        ),
      ),
    );
  }
}
