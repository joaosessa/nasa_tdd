import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_tdd/features/data/models/space_media_model.dart';
import 'package:nasa_tdd/features/domain/entities/space_media_entity.dart';

void main() {
  final spaceMediaMock = """ {
      "copyright": "Frank Kuszaj",
      "date": "2021-02-02",
      "explanation": "Meteors can be colorful. While the human eye usually cannot discern many colors, cameras often can. Pictured is a Quadrantids meteor captured by camera over Missouri, USA, early this month that was not only impressively bright, but colorful. The radiant grit, likely cast off by asteroid 2003 EH1, blazed a path across Earth's atmosphere.  Colors in meteors usually originate from ionized elements released as the meteor disintegrates, with blue-green typically originating from magnesium, calcium radiating violet, and nickel glowing green. Red, however, typically originates from energized nitrogen and oxygen in the Earth's atmosphere.  This bright meteoric fireball was gone in a flash -- less than a second -- but it left a wind-blown ionization trail that remained visible for several minutes.   APOD is available via Facebook: in English, Catalan and Portuguese",
      "hdurl": "https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_5341.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "A Colorful Quadrantid Meteor",
      "url": "https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg"
    }""";

  final tSpaceMediaModel = SpaceMediaModel(
    title: "A Colorful Quadrantid Meteor",
    description:
        "Meteors can be colorful. While the human eye usually cannot discern many colors, cameras often can. Pictured is a Quadrantids meteor captured by camera over Missouri, USA, early this month that was not only impressively bright, but colorful. The radiant grit, likely cast off by asteroid 2003 EH1, blazed a path across Earth's atmosphere.  Colors in meteors usually originate from ionized elements released as the meteor disintegrates, with blue-green typically originating from magnesium, calcium radiating violet, and nickel glowing green. Red, however, typically originates from energized nitrogen and oxygen in the Earth's atmosphere.  This bright meteoric fireball was gone in a flash -- less than a second -- but it left a wind-blown ionization trail that remained visible for several minutes.   APOD is available via Facebook: in English, Catalan and Portuguese",
    mediaType: "image",
    mediaUrl:
        "https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg",
  );

  test('should be a subclass of space media entity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', () {
    final jsonMap = jsonDecode(spaceMediaMock);

    final result = SpaceMediaModel.fromJson(jsonMap);

    expect(result, tSpaceMediaModel);
  });
}
