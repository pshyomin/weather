import 'package:json_annotation/json_annotation.dart';

part 'dust_model.g.dart';

@JsonSerializable()
class DustModel {
  Response? response;
  DustModel({this.response});

  factory DustModel.fromJson(Map<String, dynamic> json) =>
      _$DustModelFromJson(json);
  Map<String, dynamic> toJson() => _$DustModelToJson(this);
}

@JsonSerializable()
class Response {
  Body? body;
  Header? header;
  Response({this.body, this.header});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Body {
  int? totalCount;
  List<Items>? items;
  int? pageNo;
  int? numOfRows;

  Body({this.totalCount, this.items, this.pageNo, this.numOfRows});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

@JsonSerializable()
class Items {
  String? so2Grade;
  String? coFlag;
  String? khaiValue;
  String? so2Value;
  String? coValue;
  String? pm25Flag;
  String? pm10Flag;
  String? o3Grade;
  String? pm10Value;
  String? khaiGrade;
  String? pm25Value;
  String? sidoName;
  String? no2Flag;
  String? no2Grade;
  String? o3Flag;
  String? pm25Grade;
  String? so2Flag;
  String? dataTime;
  String? coGrade;
  String? no2Value;
  String? stationName;
  String? pm10Grade;
  String? o3Value;

  Items(
      {this.so2Grade,
      this.coFlag,
      this.khaiValue,
      this.so2Value,
      this.coValue,
      this.pm25Flag,
      this.pm10Flag,
      this.o3Grade,
      this.pm10Value,
      this.khaiGrade,
      this.pm25Value,
      this.sidoName,
      this.no2Flag,
      this.no2Grade,
      this.o3Flag,
      this.pm25Grade,
      this.so2Flag,
      this.dataTime,
      this.coGrade,
      this.no2Value,
      this.stationName,
      this.pm10Grade,
      this.o3Value});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Header {
  String? resultMsg;
  String? resultCode;

  Header({this.resultMsg, this.resultCode});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}
