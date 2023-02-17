// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Live _$LiveFromJson(Map<String, dynamic> json) => Live(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LiveToJson(Live instance) => <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
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
      dataType: json['dataType'] as String?,
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int?,
      numOfRows: json['numOfRows'] as int?,
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'items': instance.items,
      'pageNo': instance.pageNo,
      'numOfRows': instance.numOfRows,
      'totalCount': instance.totalCount,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      baseDate: json['baseDate'] as String?,
      baseTime: json['baseTime'] as String?,
      category: json['category'] as String?,
      nx: json['nx'] as int?,
      ny: json['ny'] as int?,
      obsrValue: json['obsrValue'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'baseDate': instance.baseDate,
      'baseTime': instance.baseTime,
      'category': instance.category,
      'nx': instance.nx,
      'ny': instance.ny,
      'obsrValue': instance.obsrValue,
    };
