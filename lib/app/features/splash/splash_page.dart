import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TextEditingController _textFormController = TextEditingController();

  Future<Database> initDb() async {
    bool exists = await databaseExists("dictionary_db");

    if (!exists) {
      print('O banco de dados está sendo criado.');

      return openDatabase("dictionary_db", onCreate: (db, version) {
        db.execute(
          'CREATE TABLE words('
          'id INTEGER PRIMARY KEY, '
          'word TEXT, '
          'favorite INTEGER)',
        );
      }, version: 1);
    }

    print('O banco de dados já existe');
    return openDatabase("dictionary_db");
  }

  @override
  void initState() {
    initDb();
    print('Aqui vai um teste');
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
                controller: _textFormController,
              ),
              InkWell(
                child: const Text('Salvar'),
                onTap: () async {
                  Database worksDB = await openDatabase("dictionary_db");

                  await worksDB.insert('words',
                      {'word': _textFormController.text, 'favorite': 1});
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
