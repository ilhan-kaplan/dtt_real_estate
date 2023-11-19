// ignore_for_file: depend_on_referenced_packages

import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> internetCheck() async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();
  // ignore: avoid_print
  print(result);
  /*if (result != ConnectivityResult.mobile &&
      result != ConnectivityResult.wifi) {
    return false; //false
  } else {
    return true;
  }*/
  return true;
}
