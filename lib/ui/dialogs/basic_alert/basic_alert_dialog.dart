import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/app_colors.dart';
import '../../common/app_styles.dart';
import '../../config/size_config.dart';
import 'basic_alert_dialog_model.dart';

class BasicAlertDialog extends StackedView<BasicAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BasicAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BasicAlertDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 36 * SizeConfig.heightMultiplier!,
        child: Column(
          children: [
            Container(
              height: 18 * SizeConfig.heightMultiplier!,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: viewModel.getStatusColor(request.data),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Lottie.asset(viewModel.getStatusLottie(request.data),
                  repeat: false),
            ),
            Container(
              height: 18 * SizeConfig.heightMultiplier!,
              decoration: const BoxDecoration(
                  color: kcBlack,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    request.title!,
                    style: alertTextStyle.copyWith(
                        fontSize: 2.2 * SizeConfig.textMultiplier!),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier!,
                  ),
                  Text(
                    request.description!,
                    style: alertTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2 * SizeConfig.heightMultiplier!,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () =>
                              completer(DialogResponse(confirmed: false)),
                          child: SizedBox(
                            height: 4 * SizeConfig.heightMultiplier!,
                            width: 25 * SizeConfig.widthMultiplier!,
                            child: Center(
                              child: Text(
                                request.secondaryButtonTitle!,
                                style: ktsAlertButtonTextStyle,
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 2 * SizeConfig.widthMultiplier!,
                      ),
                      GestureDetector(
                          onTap: () =>
                              completer(DialogResponse(confirmed: true)),
                          child: Container(
                            height: 4 * SizeConfig.heightMultiplier!,
                            width: 25 * SizeConfig.widthMultiplier!,
                            decoration: BoxDecoration(
                                color: viewModel.getStatusColor(request.data),
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: Text(
                                request.mainButtonTitle!,
                                style: ktsAlertButtonTextStyle,
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BasicAlertDialogModel viewModelBuilder(BuildContext context) =>
      BasicAlertDialogModel();
}
