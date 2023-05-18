import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';

class FirebaseNotificationService with ListenableServiceMixin {
  final _navService = locator<NavigationService>();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  StreamSubscription<RemoteMessage>? _streamSubscriptionForground;
  StreamSubscription<RemoteMessage>? _streamSubscriptionBackground;

  Future initialize() async {
    if (Platform.isIOS) {
      await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
    updateUserToken();
    /*  *********** When the app is open *********** */
    _streamSubscriptionForground =
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        if (message.data['notificationType'] == 'logout') {
          getUserLogout();
        }
      }
    });
    // _streamSubscription =
    _streamSubscriptionBackground =
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        if (message.data['notificationType'] == 'logout') {
          getUserLogout();
        }
      }
    });
  }

  void updateUserToken() async {
    var token = await _fcm.getToken();
    if (token != null) {
      // if (_authService.userInfo != null) {
      //   var map = {
      //     '_id': _authService.userInfo!.id,
      //     'firebaseToken': token,
      //     'deviceInfo': await Utils.getFromSecure(Constants.deviceInfo),
      //   };
      //   _apiRep.updateFcmToken(
      //       await Utils.getFromSecure(Constants.userToken), map);
      // }
    }
  }

  getUserLogout() async {
    /* handling duplicate notifictions */
    _streamSubscriptionForground!.cancel();
    _streamSubscriptionBackground!.cancel();
    _navService.clearStackAndShow(Routes.startupView);
    _fcm.deleteToken();
    // Utils.deleteUser();
    // sl.resetLazySingleton<AuthUserService>(instance: sl<AuthUserService>());
    // sl.resetLazySingleton<HomeService>(instance: sl<HomeService>());
    // sl.resetLazySingleton<FlutterSecureStorage>(
    //     instance: sl<FlutterSecureStorage>());

    // return Utils.showCustomSnackbar(
    //     'You are forcefully logout!', 'Please Login again');
  }
}
