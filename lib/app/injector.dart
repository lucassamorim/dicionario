import 'package:auto_injector/auto_injector.dart';

import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/presenter/stores/home_store.dart';

final injector = AutoInjector(
  on: (injector) {
    injector.add<HomeRepository>(HomeRepositoryImpl.new);
    injector.add(HomeStore.new);
  },
);
