import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_tdd/core/usecases/failures.dart';
import 'package:nasa_tdd/features/domain/entities/space_media_entity.dart';

import 'package:nasa_tdd/features/domain/repositories/space_media_repository.dart';
import 'package:nasa_tdd/features/domain/usecases/get_space_media_from_date_usecase.dart';

class SpaceMediaRepositoryMock extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = SpaceMediaRepositoryMock();
    usecase = GetSpaceMediaFromDateUsecase(repository: repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
    title: 'title',
    description: 'description',
    mediaType: 'mediaType',
    mediaUrl: 'mediaUrl',
  );

  final tDate = DateTime.now();

  test(
    'should get space media entity from date from the repository',
    () async {
      when(
        () => repository.getSpaceMediaFromDate(date: tDate),
      ).thenAnswer(
        (_) async => right(tSpaceMedia),
      );

      final result = await usecase(tDate);

      expect(result, right(tSpaceMedia));

      verify(() => repository.getSpaceMediaFromDate(date: tDate));
    },
  );

  test(
    'should return a failure when dont succeed',
    () async {
      when(
        () => repository.getSpaceMediaFromDate(date: tDate),
      ).thenAnswer(
        (_) async => left(ServerFailure()),
      );

      final result = await usecase(tDate);

      expect(result, left(ServerFailure()));

      verify(() => repository.getSpaceMediaFromDate(date: tDate));
    },
  );
}
