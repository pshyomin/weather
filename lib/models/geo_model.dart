import 'package:json_annotation/json_annotation.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class GeoModel {
  Status? status;
  List<Results>? results;

  GeoModel({this.status, this.results});

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeoModelToJson(this);
}

@JsonSerializable()
class Status {
  int? code;
  String? name;
  String? message;

  Status({this.code, this.name, this.message});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Results {
  String? name;
  Code? code;
  Region? region;

  Results({this.name, this.code, this.region});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Code {
  String? id;
  String? type;
  String? mappingId;

  Code({this.id, this.type, this.mappingId});

  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);
  Map<String, dynamic> toJson() => _$CodeToJson(this);
}

@JsonSerializable()
class Region {
  Area0? area0;
  Area0? area1;
  Area0? area2;
  Area0? area3;
  Area0? area4;

  Region({this.area0, this.area1, this.area2, this.area3, this.area4});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class Area0 {
  String? name;
  Coords? coords;
  String? alias;

  Area0({this.name, this.coords, this.alias});

  factory Area0.fromJson(Map<String, dynamic> json) => _$Area0FromJson(json);
  Map<String, dynamic> toJson() => _$Area0ToJson(this);
}

@JsonSerializable()
class Coords {
  Center? center;

  Coords({this.center});

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

@JsonSerializable()
class Center {
  String? crs;
  double? x;
  double? y;

  Center({this.crs, this.x, this.y});

  factory Center.fromJson(Map<String, dynamic> json) => _$CenterFromJson(json);
  Map<String, dynamic> toJson() => _$CenterToJson(this);
}
