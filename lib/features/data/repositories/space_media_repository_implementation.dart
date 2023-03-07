import 'package:nasa_tdd/core/usecases/exceptions.dart';
import 'package:nasa_tdd/features/data/datasource/space_media_data_source.dart';
import 'package:nasa_tdd/features/domain/entities/space_media_entity.dart';
import 'package:nasa_tdd/core/usecases/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:nasa_tdd/features/domain/repositories/space_media_repository.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDataSource dataSource;

  SpaceMediaRepositoryImplementation({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate({
    required DateTime date,
  }) async {
    try {
      final spaceMedia = await dataSource.getSpaceMediaFromDate(date: date);

      return right(spaceMedia);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
