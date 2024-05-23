import 'package:dicionario/app/core/errors/default_exception.dart';
import 'package:dicionario/app/features/home/domain/entities/word_entity.dart';
import 'package:dicionario/app/features/home/domain/repositories/home_repository.dart';
import 'package:dicionario/app/features/home/data/repositories/home_repository_impl.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Deve retornar as uma lista com todas as palavas do JSON - Sucesso!',
      () async {
    final HomeRepositoryImpl repository = HomeRepositoryImpl();
    final response = await repository.fetchWords();
    expect(response.fold((l) {}, (r) => r), isA<List<WordEntity>>());
  });

  test('Deve retornar uma exception em caso de erro - Erro', () async {
    final HomeRepository repository = HomeRepositoryMock();
    when(() => repository.fetchWords()).thenAnswer((_) async =>
        Left(DefaultException(message: 'Erro ao executar o JSON')));
    final response = await repository.fetchWords();
    expect(response.fold((l) => l, (r) {}), isA<DefaultException>());
  });
}
