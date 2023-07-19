import 'package:json_annotation/json_annotation.dart';
import 'package:music_demo/core/utils/type_def.dart';

part 'music_item.g.dart';

@JsonSerializable()
class MusicItem {
  @JsonKey(name: "wrapperType")
  final String? wrapType;

  @JsonKey(name: "kind")
  final String? kind;

  @JsonKey(name: "collectionId")
  final int? collectionId;

  @JsonKey(name: "trackId")
  final int? trackId;

  @JsonKey(name: "artistName")
  final String? artistName;

  @JsonKey(name: "collectionName")
  final String? collectionName;

  @JsonKey(name: "trackName")
  final String? trackName;

  @JsonKey(name: "collectionCensoredName")
  final String? collectionCensoredName;

  @JsonKey(name: "trackCensoredName")
  final String? trackCensoredName;

  @JsonKey(name: "artworkUrl30")
  final String? artworkUrl30;

  @JsonKey(name: "artworkUrl60")
  final String? artworkUrl60;

  @JsonKey(name: "artworkUrl100")
  final String? artworkUrl100;

  @JsonKey(name: "collectionPrice")
  final double? collectionPrice;

  MusicItem(
      this.wrapType,
      this.kind,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice);

  Jmap toJson() => _$MusicItemToJson(this);

  factory MusicItem.fromJson(json) => _$MusicItemFromJson(json);

  bool get isSong => kind?.toLowerCase() == "song";

  bool get isAlbumOrArtist =>
      switch (kind?.toLowerCase()) { "album" || "artist" => true, _ => false };
}
