import 'package:json_annotation/json_annotation.dart';

part 'live_model.g.dart';

@JsonSerializable()
class Live {
  Response? response;

  Live({this.response});

  factory Live.fromJson(Map<String, dynamic> json) => _$LiveFromJson(json);
  Map<String, dynamic> toJson() => _$LiveToJson(this);
}

@JsonSerializable()
class Response {
  Header? header;
  Body? body;

  Response({this.header, this.body});

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
  String? dataType;
  Items? items;
  int? pageNo;
  int? numOfRows;
  int? totalCount;

  Body(
      {this.dataType,
      this.items,
      this.pageNo,
      this.numOfRows,
      this.totalCount});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
  Map<String, dynamic> toJson() => _$BodyToJson(this);
}

@JsonSerializable()
class Items {
  List<Item>? item;

  Items({this.item});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Item {
  String? baseDate;
  String? baseTime;
  String? category;
  int? nx;
  int? ny;
  String? obsrValue;

  Item(
      {this.baseDate,
      this.baseTime,
      this.category,
      this.nx,
      this.ny,
      this.obsrValue});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
