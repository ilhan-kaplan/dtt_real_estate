// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:async';

import 'package:dtt_real_estate/controller/service/google_map_request.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapShow extends StatefulWidget {
  double latitude;
  double longitude;
  GoogleMapShow(this.latitude, this.longitude);

  @override
  State<GoogleMapShow> createState() => _GoogleMapShowState();
}

class _GoogleMapShowState extends State<GoogleMapShow> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  double mapBottomPadding = 20;

  List<LatLng> pollyLineCoordinates = [];
  Set<Polyline> polyline = {};

  late Position currentPosition;
  var geoLocator = Geolocator();
  late LocationPermission permission;
  late LatLng pos;

  void setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    LatLng userPos = LatLng(position.latitude, position.longitude);
    pos = LatLng(widget.latitude, widget.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));

    /*GoogleMapsAPI.findCoordinatedAddress(
        widget.latitude, widget.longitude, 'house', context);*/

    GoogleMapsAPI.findCoordinatedAddress(
        userPos.latitude, userPos.longitude, 'user', context);
    setState(() {});
  }

  /*final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(widget.latitude, widget.longitude), //DTT Address
    zoom: 14.4746,
  );*/

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: mapBottomPadding),
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.latitude, widget.longitude), //DTT Address
        zoom: 14.4746,
      ),
      markers: {
        Marker(
          markerId: MarkerId('Amsterdam'),
          position: LatLng(widget.latitude, widget.longitude),
        )
      },
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        mapController = controller;
        setupPositionLocator();
      },
    );
  }
}
