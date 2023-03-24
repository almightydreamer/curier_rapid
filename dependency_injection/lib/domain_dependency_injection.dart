import 'package:get_it/get_it.dart';
import 'package:domain/modules/home/something/usecase/get_something_usecase.dart';
import 'package:domain/modules/home/something/repository/something_repository.dart';

Future<void> init() async {
  final domainDi = GetIt.instance;
  print('DomainDI : initialization started');

  domainDi.registerLazySingleton<GetSomethingUseCase>(() => GetSomethingUseCase(domainDi<SomethingRepository>()));

  print('DomainDI : initialization finished');
}
