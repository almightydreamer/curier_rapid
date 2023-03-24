import 'package:domain/core/request/response.dart';
import 'package:domain/modules/home/something/entity/something_entity.dart';
import 'package:either_dart/either.dart';


abstract class SomethingRepository {
  Future<Either<Failure, SomethingEntity>> getApiSomething();
}