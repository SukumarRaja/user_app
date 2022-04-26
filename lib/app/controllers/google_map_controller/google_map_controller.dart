import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/app/data/repository/http/google_map_repository/google_map_repository.dart';

class MapController extends GetxController {
  final repository = GoogleMapRepository();

  static MapController get to => Get.put(MapController());

  Completer<GoogleMapController> mapController = Completer();
  late GoogleMapController newGoogleMapController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final CameraPosition googlePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late Type currentPosition = Position;
  var geoLocator = Geolocator();


  final _bottomPaddingOfMap = 0.obs;
  get bottomPaddingOfMap => _bottomPaddingOfMap.value;
  set bottomPaddingOfMap(value) {
    _bottomPaddingOfMap.value = value;
  }

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position as Type;
    LatLng latLng = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
