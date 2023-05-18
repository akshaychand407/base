import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.bottomsheets.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../common/app_strings.dart';
import '../../enums/basic_dialog_status.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<void> showErrorDialog() async {
    final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basicAlert,
        data: BasicDialogStatus.error,
        title: 'Error Dialog',
        description: 'Description',
        mainButtonTitle: 'Yes',
        secondaryButtonTitle: 'No');
    if (dialogResult!.confirmed) {
      //  Add an action when for main button click
    }
  }

  Future<void> showSucessDialog() async {
    final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basicAlert,
        data: BasicDialogStatus.success,
        title: 'Success Dialog',
        description: 'Description',
        mainButtonTitle: 'Yes',
        secondaryButtonTitle: 'No');
    if (dialogResult!.confirmed) {
      //  Add an action when for main button click
    }
  }

  Future<void> showWarningDialog() async {
    final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basicAlert,
        data: BasicDialogStatus.warning,
        title: 'Warning Dialog',
        description: 'Description',
        mainButtonTitle: 'Yes',
        secondaryButtonTitle: 'No');
    if (dialogResult!.confirmed) {
      //  Add an action when for main button click
    }
  }

  Future<void> showQuestionDialog() async {
    final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basicAlert,
        data: BasicDialogStatus.question,
        title: 'Question Dialog',
        description: 'Description',
        mainButtonTitle: 'Yes',
        secondaryButtonTitle: 'No');
    if (dialogResult!.confirmed) {
      //  Add an action when for main button click
    }
  }
}
