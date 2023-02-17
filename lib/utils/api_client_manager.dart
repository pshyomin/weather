import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import '../models/daily_model.dart';
import '../models/dust_model.dart';
import '../models/geo_model.dart';
import '../models/live_day_model.dart';
import '../models/live_model.dart';
import '../models/sun_model.dart';

class APIClientManager {
  final http.Client client;
  APIClientManager({
    required this.client,
  });

  final String _serviceKey =
      'qzs5KWUG6aHAcfS7SaJ%2BIal7gMsJxlkEYru66EiL0oB4VeYUaP4FJHVndm%2BZTxxe5usZZjqfktTF9ToMZjq4yA%3D%3D';

  Future<Live> fetchLive(
      Point<num> latlong, String baseData, String hour, String minute) async {
    int iHour = int.parse(hour);

    if (iHour != 0) {
      iHour -= 1;
      if (iHour < 0) iHour = 23;
    }

    var url =
        'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=$_serviceKey&pageNo=1&numOfRows=1000&dataType=json&base_date=$baseData&base_time=${iHour}00&nx=${latlong.x}&ny=${latlong.y}';

    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      "content-type": "application/json"
    };

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var live = jsonDecode(response.body);
    if (kDebugMode) {
      print(live);
    }
    return Live.fromJson(live);
  }

  Future<LiveDayModel> fetchLiveDay(
      Point<num> latlong, String baseData, String hour, String minute) async {
    int iHour = int.parse(hour);
    int iMinute = int.parse(minute);

    if (iMinute > 45) {
      if (iHour != 0) {
        iHour -= 1;
        if (iHour < 0) iHour = 23;
      }
      iMinute = 45;
    }
    var url =
        'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?serviceKey=$_serviceKey&pageNo=1&numOfRows=1000&dataType=json&base_date=$baseData&base_time=$iHour$iMinute&nx=${latlong.x}&ny=${latlong.y}';

    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      "content-type": "application/json"
    };

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var liveDay = jsonDecode(response.body);
    if (kDebugMode) {
      print(liveDay);
    }
    return LiveDayModel.fromJson(liveDay);
  }

  Future<Daily> fetchDaily(
      Point<num> latlong, String baseData, String hour) async {
    int iData = int.parse(baseData);
    int iHour = int.parse(hour);

    if (iHour < 5) {
      iData -= 1;
    }

    var url =
        'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=$_serviceKey&pageNo=1&numOfRows=1000&dataType=json&base_date=$iData&base_time=0500&nx=${latlong.x}&ny=${latlong.y}';

    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      "content-type": "application/json"
    };

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var daily = jsonDecode(response.body);
    if (kDebugMode) {
      print(daily);
    }
    return Daily.fromJson(daily);
  }

  Future<SunModel> fetchSun(String legalcode, String baseData) async {
    var url =
        'https://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo?serviceKey=$_serviceKey&locdate=$baseData&location=$legalcode';

    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      "content-type": "application/xml"
    };

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    final getXml = response.body;
    final conventData = Xml2Json()..parse(getXml);
    final jsonData = conventData.toParker();
    var sun = jsonDecode(jsonData);
    if (kDebugMode) {
      print(sun);
    }
    return SunModel.fromJson(sun);
  }

  Future<DustModel> fetchDust(String legalcode) async {
    var url =
        'https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=$_serviceKey&returnType=json&numOfRows=100&pageNo=1&sidoName=$legalcode&ver=1.0';

    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      "content-type": "application/json"
    };

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var dust = jsonDecode(response.body);
    if (kDebugMode) {
      print(dust);
    }
    return DustModel.fromJson(dust);
  }

  Future<GeoModel> fetchGeocoding(double lat, double long) async {
    var url =
        'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=$long,$lat&output=json';

    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      "content-type": "application/json",
      'X-NCP-APIGW-API-KEY-ID': 'rteej8ys8c', //Client ID
      'X-NCP-APIGW-API-KEY':
          'mUn0IoY6W3uCDImXFtgqxCigwbXeL7l9nNk36SbG' //Client secret
    };

    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception('error api');
    }

    var geo = jsonDecode(response.body);
    if (kDebugMode) {
      print(geo);
    }

    return GeoModel.fromJson(geo);
  }
}
