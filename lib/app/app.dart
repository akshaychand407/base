import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../api/api_impl.dart';
import '../db/db_impl.dart';
import '../services/api_service.dart';
import '../services/connectivity_service.dart';
import '../services/db_service.dart';
import '../services/firebase_notification_service.dart';
import '../services/location_service.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/dialogs/basic_alert/basic_alert_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: FirebaseNotificationService),
    LazySingleton(classType: ApiImpl, asType: ApiService),
    LazySingleton(classType: DbImpl, asType: DbService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: BasicAlertDialog),
// @stacked-dialog
  ],
)
class App {}
