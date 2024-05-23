import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/cache/sqflite_impl.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TextEditingController textFormController = TextEditingController();
  TextEditingController idFormController = TextEditingController();

  @override
  void initState() {
    //cache.removeDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: textFormController,
              ),
              InkWell(
                child: const Text('Salvar'),
                onTap: () async {
                  // await cache.insert('works',
                  //     {'script': textFormController.text, 'favorite': 1});
                },
              ),
              TextFormField(
                controller: idFormController,
              ),
              InkWell(
                child: const Text('Salvar alteração'),
                onTap: () async {
                  await SqfliteImpl().update(
                      'works', {'name': idFormController.text}, 'id = ?', [46]);
                },
              ),
              const SizedBox(height: 10),
              const FlutterLogo(size: 100),
              const SizedBox(height: 100),
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              const Text('Um momento, por favor...'),
              InkWell(
                child: const Text('Adicionar mais informações'),
                onTap: () async {
                  Database worksDB = await openDatabase("dictionary_db");

                  await worksDB
                      .insert('works', {'word': 'Teste', 'favorite': 1});
                  print('Dados adicionados com sucesso!');
                },
              ),
              SizedBox(height: 20),
              InkWell(
                child: const Text('Listar informações'),
                onTap: () async {
                  //print(await cache.get("works", {}));

                  final testeWorks =
                      await SqfliteImpl().get('works', 'favorite = ?', ["1"]);
                  print(testeWorks);
                },
              ),
              SizedBox(height: 20),
              InkWell(
                child: const Text('Adicionar registro'),
                onTap: () async {
                  await SqfliteImpl().insert('works', {
                    'name': textFormController.text,
                    'script': "Aqui vai um script",
                    'favorite': 1,
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
