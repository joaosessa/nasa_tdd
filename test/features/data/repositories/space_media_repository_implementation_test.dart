import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_tdd/core/usecases/exceptions.dart';
import 'package:nasa_tdd/core/usecases/failures.dart';
import 'package:nasa_tdd/features/data/datasource/space_media_data_source.dart';
import 'package:nasa_tdd/features/data/models/space_media_model.dart';
import 'package:nasa_tdd/features/data/repositories/space_media_repository_implementation.dart';

class SpaceMediaDataSourceMock extends Mock implements ISpaceMediaDataSource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDataSource dataSource;

  setUp(() {
    dataSource = SpaceMediaDataSourceMock();
    repository = SpaceMediaRepositoryImplementation(dataSource: dataSource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
    title: 'title',
    description: 'description',
    mediaType: 'mediaType',
    mediaUrl: 'mediaUrl',
  );

  final tDate = DateTime.now();

  test(
    'should return space media model when calls the data source',
    () async {
      when(
        () => dataSource.getSpaceMediaFromDate(date: tDate),
      ).thenAnswer(
        (_) async => tSpaceMediaModel,
      );

      final result = await repository.getSpaceMediaFromDate(date: tDate);

      expect(result, right(tSpaceMediaModel));

      verify(() => dataSource.getSpaceMediaFromDate(date: tDate));
    },
  );

  test(
    'should return server failure when datasource throws exception',
    () async {
      when(
        () => dataSource.getSpaceMediaFromDate(date: tDate),
      ).thenThrow(
        ServerException(),
      );

      final result = await repository.getSpaceMediaFromDate(date: tDate);

      expect(result, left(ServerFailure()));

      verify(() => dataSource.getSpaceMediaFromDate(date: tDate));
    },
  );
}
