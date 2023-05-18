import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_assets.dart';
import '../../common/app_colors.dart';
import '../../enums/basic_dialog_status.dart';

class BasicAlertDialogModel extends BaseViewModel {
  Color getStatusColor(dynamic customData) {
    if (customData is BasicDialogStatus) {
      switch (customData) {
        case BasicDialogStatus.error:
          return kcErrorRed;
        case BasicDialogStatus.warning:
          return kcPrimaryColor;
        case BasicDialogStatus.question:
          return kcExtraLightBlue;
        default:
          return kcSuccessGreen;
      }
    } else {
      return kcSuccessGreen;
    }
  }

  String getStatusLottie(dynamic regionDialogStatus) {
    if (regionDialogStatus is BasicDialogStatus) {
      switch (regionDialogStatus) {
        case BasicDialogStatus.error:
          return kaError;
        case BasicDialogStatus.warning:
          return kaWarning;
        case BasicDialogStatus.question:
          return kaQuestion;
        default:
          return kaSuccess;
      }
    } else {
      return kaSuccess;
    }
  }
}
