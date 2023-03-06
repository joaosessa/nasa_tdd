import 'package:dartz/dartz.dart';

import 'package:nasa_tdd/core/usecases/failures.dart';
import 'package:nasa_tdd/core/usecases/usecase.dart';
import 'package:nasa_tdd/features/domain/entities/space_media_entity.dart';
import 'package:nasa_tdd/features/domain/repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase extends Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase({required this.repository});

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(date) async {
    return await repository.getSpaceMediaFromDate(date: date);
  }
}
