// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:dtt_real_estate/constants/endpoints.dart';
import 'package:dtt_real_estate/controller/store/appData.dart';
import 'package:dtt_real_estate/model/estate/EstateModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HTTPRequest {
  static String baseUrl = BaseURL.prod;

  static Map<String, String> headers() {
    Map<String, String> inAppHeader;
    return inAppHeader = {
      "Content-Type": "application/json",
      "Response-Type": "application/json",
      'Access-Key': '98bww4ezuzfePCYFxJEWyszbUXc7dxRx'
    };
  }

  static Future<bool> estateRequest(context) async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl), headers: headers())
          .timeout(const Duration(seconds: 10));
      logResponse(baseUrl, response.statusCode.toString(), response.body);
      if (response.statusCode == 200) {
        List<EstateModel> estateList = (json.decode(response.body) as List)
            .map((data) => EstateModel.fromJson(data))
            .toList();
        Provider.of<AppData>(context, listen: false).getEstateList(estateList);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static logResponse(String url, String statusCode, String body) {
    log(' ');
    log('---------------START---------------');
    log('URL: $url');
    log('Status Code: ${statusCode.toString()}');
    log('Body: $body');
    log('---------------END---------------');
    log(' ');
  }
}
