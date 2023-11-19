import 'package:dtt_real_estate/model/estate/EstateModel.dart';
import 'package:dtt_real_estate/model/google_maps/Address.dart';
import 'package:dtt_real_estate/model/google_maps/lat_long.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  List<EstateModel>? estateList;
  LatLong? userLatLong;
  List<String>? housesSidtanceList;
  Address? houseAddress;
  Address? currentPosition;
  String? distance;

  void getEstateList(List<EstateModel> response) {
    estateList = response;
    notifyListeners();
  }

  void getUserLatLong(LatLong response) {
    userLatLong = response;
    notifyListeners();
  }

  void getHousesDistance(List<String> response) {
    housesSidtanceList = response;
    notifyListeners();
  }

  void gethouseAddress(Address response) {
    houseAddress = response;
    notifyListeners();
  }

  void getcurrentPosition(Address response) {
    currentPosition = response;
    notifyListeners();
  }

  void getDistance(String response) {
    distance = response;
    notifyListeners();
  }
}
