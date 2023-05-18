import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  var isDeviceConnected = false;
  init() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        isDeviceConnected = true;
      } else {
        isDeviceConnected = false;
      }
      if (isDeviceConnected) {
        Future.delayed(const Duration(seconds: 2), () {});
      }
    });
  }

  onCancel() {
    _connectivitySubscription.cancel();
  }

  Future<bool> isConnected() async {
    bool result;
    var connectivityResult = await (Connectivity().checkConnectivity());
    (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi)
        ? result = true
        : result = false;
    return result;
  }
}
