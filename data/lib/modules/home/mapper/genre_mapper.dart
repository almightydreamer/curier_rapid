import 'package:data/modules/home/dto/api/something_api_dto.dart';
import 'package:domain/modules/home/something/entity/something_entity.dart';

class SomethingMapper {
  SomethingEntity mapApiToEntity(SomethingApiDTO input) {
    return SomethingEntity(id: input.id, name: input.name);
  }
}
