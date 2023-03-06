import 'package:dartz/dartz.dart';

import '../../../core/usecases/failures.dart';
import '../entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate({
    required DateTime date,
  });
}
