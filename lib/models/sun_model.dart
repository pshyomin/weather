import 'package:json_annotation/json_annotation.dart';

part 'sun_model.g.dart';

@JsonSerializable()
class SunModel {
  Response? response;

  SunModel({this.response});

  factory SunModel.fromJson(Map<String, dynamic> json) =>
      _$SunModelFromJson(json);
  Map<String, dynamic> toJson() => _$SunModelToJson(this);
}

@JsonSerializable()
class Response {
  String? script;
  Header? header;
  Body? body;

  Response({this.script, this.header, this.body});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Header {
  String? resultCode;
  String? resultMsg;

  Header({this.resultCode, this.resultMsg});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

@JsonSerializable()
class Body {
  Items? items;
  String? numOfRows;
  String? pageNo;
  String? totalCount;

  Body({this.items, this.numOfRows, this.pageNo, this.totalCount});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

@JsonSerializable()
class Items {
  Item? item;

  Items({this.item});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Item {
  String? aste;
  String? astm;
  String? civile;
  String? civilm;
  String? latitude;
  double? latitudeNum;
  String? location;
  String? locdate;
  String? longitude;
  double? longitudeNum;
  String? moonrise;
  String? moonset;
  String? moontransit;
  String? naute;
  String? nautm;
  String? sunrise;
  String? sunset;
  String? suntransit;

  Item(
      {this.aste,
      this.astm,
      this.civile,
      this.civilm,
      this.latitude,
      this.latitudeNum,
      this.location,
      this.locdate,
      this.longitude,
      this.longitudeNum,
      this.moonrise,
      this.moonset,
      this.moontransit,
      this.naute,
      this.nautm,
      this.sunrise,
      this.sunset,
      this.suntransit});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
