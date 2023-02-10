// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SunModel _$SunModelFromJson(Map<String, dynamic> json) => SunModel(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SunModelToJson(SunModel instance) => <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      script: json['script'] as String?,
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'script': instance.script,
      'header': instance.header,
      'body': instance.body,
    };

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      resultCode: json['resultCode'] as String?,
      resultMsg: json['resultMsg'] as String?,
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

Body _$BodyFromJson(Map<String, dynamic> json) => Body(
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
      numOfRows: json['numOfRows'] as String?,
      pageNo: json['pageNo'] as String?,
      totalCount: json['totalCount'] as String?,
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      item: json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      aste: json['aste'] as String?,
      astm: json['astm'] as String?,
      civile: json['civile'] as String?,
      civilm: json['civilm'] as String?,
      latitude: json['latitude'] as String?,
      latitudeNum: double.parse(json['latitudeNum'] as String),
      location: json['location'] as String?,
      locdate: json['locdate'] as String?,
      longitude: json['longitude'] as String?,
      longitudeNum: double.parse(json['longitudeNum'] as String),
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moontransit: json['moontransit'] as String?,
      naute: json['naute'] as String?,
      nautm: json['nautm'] as String?,
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      suntransit: json['suntransit'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'aste': instance.aste,
      'astm': instance.astm,
      'civile': instance.civile,
      'civilm': instance.civilm,
      'latitude': instance.latitude,
      'latitudeNum': instance.latitudeNum,
      'location': instance.location,
      'locdate': instance.locdate,
      'longitude': instance.longitude,
      'longitudeNum': instance.longitudeNum,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moontransit': instance.moontransit,
      'naute': instance.naute,
      'nautm': instance.nautm,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'suntransit': instance.suntransit,
    };
