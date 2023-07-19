// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicItem _$MusicItemFromJson(Map<String, dynamic> json) => MusicItem(
      json['wrapperType'] as String?,
      json['kind'] as String?,
      json['collectionId'] as int?,
      json['trackId'] as int?,
      json['artistName'] as String?,
      json['collectionName'] as String?,
      json['trackName'] as String?,
      json['collectionCensoredName'] as String?,
      json['trackCensoredName'] as String?,
      json['artworkUrl30'] as String?,
      json['artworkUrl60'] as String?,
      json['artworkUrl100'] as String?,
      (json['collectionPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MusicItemToJson(MusicItem instance) => <String, dynamic>{
      'wrapperType': instance.wrapType,
      'kind': instance.kind,
      'collectionId': instance.collectionId,
      'trackId': instance.trackId,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'trackName': instance.trackName,
      'collectionCensoredName': instance.collectionCensoredName,
      'trackCensoredName': instance.trackCensoredName,
      'artworkUrl30': instance.artworkUrl30,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'collectionPrice': instance.collectionPrice,
    };
