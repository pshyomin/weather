// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dust_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DustModel _$DustModelFromJson(Map<String, dynamic> json) => DustModel(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DustModelToJson(DustModel instance) => <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'body': instance.body,
      'header': instance.header,
    };

Body _$BodyFromJson(Map<String, dynamic> json) => Body(
      totalCount: json['totalCount'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageNo: json['pageNo'] as int?,
      numOfRows: json['numOfRows'] as int?,
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'items': instance.items,
      'pageNo': instance.pageNo,
      'numOfRows': instance.numOfRows,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      so2Grade: json['so2Grade'] as String?,
      coFlag: json['coFlag'] as String?,
      khaiValue: json['khaiValue'] as String?,
      so2Value: json['so2Value'] as String?,
      coValue: json['coValue'] as String?,
      pm25Flag: json['pm25Flag'] as String?,
      pm10Flag: json['pm10Flag'] as String?,
      o3Grade: json['o3Grade'] as String?,
      pm10Value: json['pm10Value'] as String?,
      khaiGrade: json['khaiGrade'] as String?,
      pm25Value: json['pm25Value'] as String?,
      sidoName: json['sidoName'] as String?,
      no2Flag: json['no2Flag'] as String?,
      no2Grade: json['no2Grade'] as String?,
      o3Flag: json['o3Flag'] as String?,
      pm25Grade: json['pm25Grade'] as String?,
      so2Flag: json['so2Flag'] as String?,
      dataTime: json['dataTime'] as String?,
      coGrade: json['coGrade'] as String?,
      no2Value: json['no2Value'] as String?,
      stationName: json['stationName'] as String?,
      pm10Grade: json['pm10Grade'] as String?,
      o3Value: json['o3Value'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'so2Grade': instance.so2Grade,
      'coFlag': instance.coFlag,
      'khaiValue': instance.khaiValue,
      'so2Value': instance.so2Value,
      'coValue': instance.coValue,
      'pm25Flag': instance.pm25Flag,
      'pm10Flag': instance.pm10Flag,
      'o3Grade': instance.o3Grade,
      'pm10Value': instance.pm10Value,
      'khaiGrade': instance.khaiGrade,
      'pm25Value': instance.pm25Value,
      'sidoName': instance.sidoName,
      'no2Flag': instance.no2Flag,
      'no2Grade': instance.no2Grade,
      'o3Flag': instance.o3Flag,
      'pm25Grade': instance.pm25Grade,
      'so2Flag': instance.so2Flag,
      'dataTime': instance.dataTime,
      'coGrade': instance.coGrade,
      'no2Value': instance.no2Value,
      'stationName': instance.stationName,
      'pm10Grade': instance.pm10Grade,
      'o3Value': instance.o3Value,
    };

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      resultMsg: json['resultMsg'] as String?,
      resultCode: json['resultCode'] as String?,
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'resultMsg': instance.resultMsg,
      'resultCode': instance.resultCode,
    };
