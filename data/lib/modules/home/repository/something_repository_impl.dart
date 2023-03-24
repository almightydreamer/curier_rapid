import 'package:data/modules/home/datasource/local_datasource.dart';
import 'package:data/modules/home/mapper/genre_mapper.dart';
import 'package:domain/core/request/response.dart';
import 'package:either_dart/either.dart';
import '../datasource/api_datasource.dart';
import '../dto/api/something_api_dto.dart';
import 'package:domain/modules/home/something/repository/something_repository.dart';
import 'package:domain/modules/home/something/entity/something_entity.dart';

class SomethingRepositoryImpl implements SomethingRepository {
  late ApiDataSource _apiDataSource;
  late LocalDataSource _localDataSource;

  SomethingRepositoryImpl({required ApiDataSource apiDataSource, required LocalDataSource localDataSource}) {
    _apiDataSource = apiDataSource;
    _localDataSource = localDataSource;
  }

  @override
  Future<Either<Failure, SomethingEntity>> getApiSomething() async {
    try {
      var response = await _apiDataSource.getSomething();
      if (response.code != 200) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      SomethingApiDTO somethingApiDTO = SomethingApiDTO.fromJson(response.data);

      return Right(SomethingMapper().mapApiToEntity(somethingApiDTO));
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
