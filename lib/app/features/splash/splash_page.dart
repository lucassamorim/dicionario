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

  late SqfliteImpl cache;

  @override
  void initState() {
    cache = SqfliteImpl();
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
                  await cache.insert('works',
                      {'script': textFormController.text, 'favorite': 1});
                },
              ),
              const SizedBox(height: 100),
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
                      .insert('words', {'word': 'Teste', 'favorite': 1});
                  print('Dados adicionados com sucesso!');
                },
              ),
              SizedBox(height: 100),
              InkWell(
                child: const Text('Listar informações'),
                onTap: () async {
                  Database worksDB = await openDatabase("dictionary_db");

                  print(await worksDB.query('words'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
