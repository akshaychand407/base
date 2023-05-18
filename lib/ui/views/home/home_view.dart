import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/app_styles.dart';
import '../../common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    Text(
                      'Hello, STACKED!',
                      style: ktsLargeBoldTextStyle,
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: Colors.black,
                      onPressed: viewModel.incrementCounter,
                      child: Text(
                        viewModel.counterLabel,
                        style: ktsWhiteTextStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: Text(
                        'Show Dialog',
                        style: ktsWhiteTextStyle,
                      ),
                      onPressed: viewModel.showDialog,
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: Text(
                        'Show Bottom Sheet',
                        style: ktsWhiteTextStyle,
                      ),
                      onPressed: viewModel.showBottomSheet,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: Text(
                        'Error Dialog',
                        style: ktsWhiteTextStyle,
                      ),
                      onPressed: viewModel.showErrorDialog,
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: Text(
                        'Success Dialog',
                        style: ktsWhiteTextStyle,
                      ),
                      onPressed: viewModel.showSucessDialog,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: Text(
                        'Warning Dialog',
                        style: ktsWhiteTextStyle,
                      ),
                      onPressed: viewModel.showWarningDialog,
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      child: Text(
                        'question Dialog',
                        style: ktsWhiteTextStyle,
                      ),
                      onPressed: viewModel.showQuestionDialog,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
