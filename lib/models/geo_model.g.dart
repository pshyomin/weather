// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoModel _$GeoModelFromJson(Map<String, dynamic> json) => GeoModel(
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeoModelToJson(GeoModel instance) => <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      code: json['code'] as int?,
      name: json['name'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'message': instance.message,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      name: json['name'] as String?,
      code: json['code'] == null
          ? null
          : Code.fromJson(json['code'] as Map<String, dynamic>),
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'region': instance.region,
    };

Code _$CodeFromJson(Map<String, dynamic> json) => Code(
      id: json['id'] as String?,
      type: json['type'] as String?,
      mappingId: json['mappingId'] as String?,
    );

Map<String, dynamic> _$CodeToJson(Code instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'mappingId': instance.mappingId,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      area0: json['area0'] == null
          ? null
          : Area0.fromJson(json['area0'] as Map<String, dynamic>),
      area1: json['area1'] == null
          ? null
          : Area0.fromJson(json['area1'] as Map<String, dynamic>),
      area2: json['area2'] == null
          ? null
          : Area0.fromJson(json['area2'] as Map<String, dynamic>),
      area3: json['area3'] == null
          ? null
          : Area0.fromJson(json['area3'] as Map<String, dynamic>),
      area4: json['area4'] == null
          ? null
          : Area0.fromJson(json['area4'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'area0': instance.area0,
      'area1': instance.area1,
      'area2': instance.area2,
      'area3': instance.area3,
      'area4': instance.area4,
    };

Area0 _$Area0FromJson(Map<String, dynamic> json) => Area0(
      name: json['name'] as String?,
      coords: json['coords'] == null
          ? null
          : Coords.fromJson(json['coords'] as Map<String, dynamic>),
      alias: json['alias'] as String?,
    );

Map<String, dynamic> _$Area0ToJson(Area0 instance) => <String, dynamic>{
      'name': instance.name,
      'coords': instance.coords,
      'alias': instance.alias,
    };

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      center: json['center'] == null
          ? null
          : Center.fromJson(json['center'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'center': instance.center,
    };

Center _$CenterFromJson(Map<String, dynamic> json) => Center(
      crs: json['crs'] as String?,
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CenterToJson(Center instance) => <String, dynamic>{
      'crs': instance.crs,
      'x': instance.x,
      'y': instance.y,
    };
