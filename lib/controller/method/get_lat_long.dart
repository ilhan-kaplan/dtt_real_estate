import 'package:dtt_real_estate/controller/store/appData.dart';
import 'package:dtt_real_estate/model/google_maps/lat_long.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

Future<bool> userPositionLocator(context) async {
  LocationPermission permission = await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation);

  //LatLng pos = LatLng(position.latitude, position.longitude);

  LatLong posOne = LatLong(position.latitude, position.longitude);
  print(position.latitude);
  Provider.of<AppData>(context, listen: false).getUserLatLong(posOne);
  return true;
}

class GeolocatorService {
  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }
}
