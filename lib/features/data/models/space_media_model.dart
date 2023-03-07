import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_tdd/features/domain/entities/space_media_entity.dart';

part 'space_media_model.g.dart';

@JsonSerializable(createToJson: false)
class SpaceMediaModel extends SpaceMediaEntity {
  final String title;

  @JsonKey(name: 'explanation')
  final String description;

  @JsonKey(name: 'media_type')
  final String mediaType;

  @JsonKey(name: 'url')
  final String mediaUrl;

  SpaceMediaModel({
    required this.title,
    required this.description,
    required this.mediaType,
    required this.mediaUrl,
  }) : super(
          title: title,
          description: description,
          mediaType: mediaType,
          mediaUrl: mediaUrl,
        );

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) =>
      _$SpaceMediaModelFromJson(json);
}
