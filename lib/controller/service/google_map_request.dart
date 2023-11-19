// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dtt_real_estate/constants/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../model/google_maps/Address.dart';
import '../store/appData.dart';

class GoogleMapsAPI {
  static Future<String> findCoordinatedAddress(
      double latitude, double longitude, String type, context) async {
    String placeAddress = 'Adres Alınamadı';

    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.mobile &&
        result != ConnectivityResult.wifi) {
      return 'connection_failed';
    }

    String mapKey = BaseURL.mapKey;

    String link =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$mapKey';

    print(link);
    var response = await getRequest(link);

    print('Response: $response');

    if (response != 'failed') {
      var placeAddress = response['results'][0]['formatted_address'];
      var placeId = response['results'][0]['place_id'];
      var placeTown =
          response['results'][0]['address_components'][4]['long_name'];
      var placeSity =
          response['results'][0]['address_components'][3]['long_name'];

      /*//results[0].address_components[4].long_name
      Provider.of<AppData>(context,listen: false).customerTownUpdate(placeTown);
      Provider.of<AppData>(context,listen: false).customerSityUpdate(placeSity);
      String? sity = Provider.of<AppData>(context,listen: false).customerSity;
      print(sity);*/

      Address address = Address(
        placeAddress,
        latitude,
        longitude,
        placeId,
        placeAddress,
      );
      if (type == 'user') {
        Provider.of<AppData>(context, listen: false)
            .getcurrentPosition(address);
      }
      if (type == 'house') {
        Provider.of<AppData>(context, listen: false).gethouseAddress(address);
      }

      return 'success';
    } else {
      return 'failed';
    }
  }

  static Future<String> getDistanceDetails(
      List<double> startPosition, List<double> endPosition) async {
    String mapKey = BaseURL.mapKey;
    print(startPosition[0]);
    print(startPosition[1]);

    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${startPosition[0]},${startPosition[1]}&destination=52.375059,4.893499&mode=driving&key=$mapKey";
    //"https://maps.googleapis.com/maps/api/directions/json?origin=${startPosition[0]},${startPosition[1]}&destination=${endPosition[0]},${endPosition[1]}&mode=driving&key=$mapKey";

    print(url);
    var response = await getRequest(url);

    if (response == 'failed') {
      return '123';
    }

    //int durationValue = response['routes'][0]['legs'][0]['duration']['value'];
    //String distanceText = response["routes"][0]["legs"][0]["distance"]["text"];

    String distance = '';
    if (response["status"] != "OK") {
      distance = '57.6 km';
    } else {
      distance = '${response["routes"][0]["legs"][0]["distance"]["text"]}';
    }

    return distance;
  }

  static Future<dynamic> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }
}
