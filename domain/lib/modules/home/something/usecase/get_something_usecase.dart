import 'package:domain/core/request/response.dart';
import 'package:domain/modules/home/something/repository/something_repository.dart';
import 'package:either_dart/either.dart';
import '../entity/something_entity.dart';

class GetSomethingUseCase {
  final SomethingRepository repository;

  GetSomethingUseCase(this.repository);

  Future<Either<Failure, SomethingEntity>> call(int pageNumber, List<int>? genres) {
    /*repository.getSomething().then((apiResponse) {
      apiResponse.fold((l) => null, (r) {
        repository.saveSomethingToLocal(r);
      });
    });
      return repository.getLocalSomething();*/
    return repository.getApiSomething();
  }
}
