import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';

import 'core/http_client/http_client.dart';
import 'features/single_word/presenter/stores/single_word_store.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/presenter/stores/home_store.dart';
import 'features/single_word/data/repositories/word_repository_impl.dart';
import 'features/single_word/domain/repositories/word_repository.dart';
import 'core/http_client/dio/dio_client_impl.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.add<Dio>(DioFactory.dio);
    injector.add<Client>(DioClientImpl.new);
    injector.add<HomeRepository>(HomeRepositoryImpl.new);
    injector.addSingleton(HomeStore.new);
    injector.add<WordRepository>(WordRepositoryImpl.new);
    injector.addSingleton(SingleWordStore.new);
    injector.commit();
  },
);
