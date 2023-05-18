import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:stacked/stacked.dart';
import '../utilities/constants.dart';

class LocationService with ListenableServiceMixin {
  String addressLine = '';
  Position? position;
  var isLocationLoading = false;
  bool isLocationServiceEnabled = false;
  bool isTimerRunning = false;
  DateTime? lastUpdatedTime;

  LatLng? coordinates;
  LocationService() {
    listenToReactiveValues([
      addressLine,
      position,
      coordinates,
      isLocationLoading,
      isLocationServiceEnabled
    ]);
  }

  Future<GeoData> getAddress(double lat, double lang) async {
    GeoData data = await Geocoder2.getDataFromCoordinates(
      latitude: lat,
      longitude: lang,
      googleMapApiKey: Constants.googleMapApiKey,
    );
    return data;
  }

  getLocation() async {
    final status = await handler.Permission.locationWhenInUse.request();

    if (status == handler.PermissionStatus.granted) {
      isLocationLoading = true;
      notifyListeners();
      isLocationServiceEnabled =
          await GeolocatorPlatform.instance.isLocationServiceEnabled();
      lastUpdatedTime = DateTime.now();
      Geolocator.getPositionStream().listen((Position position) {
        this.position = position;
        coordinates = LatLng(position.latitude, position.longitude);
      });
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      notifyListeners();
      coordinates = LatLng(position.latitude, position.longitude);
      notifyListeners();
      isLocationLoading = false;
    } else if (status == handler.PermissionStatus.denied) {
      await handler.Permission.location.request();
      // logger.d('Permission denied');
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      // logger.d('Permission Permanently Denied');
      await handler.openAppSettings();
    }
  }

  getAddressFromLatLong(LatLng coordinates) async {
    GeoData addresses = await Geocoder2.getDataFromCoordinates(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
      googleMapApiKey: Constants.googleMapApiKey,
    );
    addressLine = addresses.address;
    notifyListeners();
  }

  sendbackgroundLocation() async {
    // var userInfo = _authService.userInfo;;
    // if (userInfo != null) {
    //   LocationPermission permission =
    //       await GeolocatorPlatform.instance.requestPermission();
    //   Position position =
    //       await GeolocatorPlatform.instance.getCurrentPosition();
    //     // call Api
    // }
  }
}
