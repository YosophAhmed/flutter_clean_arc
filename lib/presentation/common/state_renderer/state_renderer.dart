import 'package:clean_arc_project/presentation/resources/assets_manger.dart';
import 'package:clean_arc_project/presentation/resources/color_manger.dart';
import 'package:clean_arc_project/presentation/resources/font_manger.dart';
import 'package:clean_arc_project/presentation/resources/strings_manger.dart';
import 'package:clean_arc_project/presentation/resources/styles_manger.dart';
import 'package:clean_arc_project/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType {
  // Popup States (Dialog)
  popupLoadingState,
  popupErrorState,
  // Full Screen States
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  // General States
  contentState,
}

class StateRenderer extends StatelessWidget {
  const StateRenderer({
    super.key,
    required this.stateRendererType,
    this.title = AppStrings.loading,
    this.message = '',
    required this.retryActionFunction,
  });

  final StateRendererType stateRendererType;
  final String title;
  final String message;
  final Function retryActionFunction;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(
      context: context,
    );
  }

  Widget _getStateWidget({
    required BuildContext context,
  }) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopupDialog(
          context: context,
          children: [
            _getAnimatedImage(
              animationName: JsonAssets.loading,
            ),
          ],
        );
      case StateRendererType.popupErrorState:
        return _getPopupDialog(
          context: context,
          children: [
            _getAnimatedImage(
              animationName: JsonAssets.error,
            ),
            _getMessage(
              message: message,
            ),
            _getRetryButton(
              context: context,
              buttonTitle: AppStrings.ok,
            ),
          ],
        );
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn(
          children: [
            _getAnimatedImage(
              animationName: JsonAssets.loading,
            ),
            _getMessage(
              message: message,
            ),
          ],
        );
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn(
          children: [
            _getAnimatedImage(
              animationName: JsonAssets.error,
            ),
            _getMessage(
              message: message,
            ),
            _getRetryButton(
              context: context,
              buttonTitle: AppStrings.retryAgain,
            ),
          ],
        );
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn(
          children: [
            _getAnimatedImage(
              animationName: JsonAssets.empty,
            ),
            _getMessage(
              message: message,
            ),
          ],
        );
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getItemsColumn({
    required List<Widget> children,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage({
    required String animationName,
  }) {
    return SizedBox(
      height: AppSize.size100,
      width: AppSize.size100,
      child: Lottie.asset(
        animationName,
      ),
    );
  }

  Widget _getMessage({
    required String message,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.padding8,
        ),
        child: Text(
          message,
          style: getRegularStyle(
            fontSize: FontSize.size18,
            color: ColorManger.black,
          ),
        ),
      ),
    );
  }

  Widget _getRetryButton({
    required String buttonTitle,
    required BuildContext context,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.padding18,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (stateRendererType == StateRendererType.fullScreenErrorState) {
                retryActionFunction.call();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              buttonTitle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPopupDialog({
    required BuildContext context,
    required List<Widget> children,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.size14,
        ),
      ),
      elevation: AppSize.size1,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManger.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            AppSize.size14,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
            ),
          ],
        ),
        child: _getDialogContent(
          context: context,
          children: children,
        ),
      ),
    );
  }

  Widget _getDialogContent({
    required BuildContext context,
    required List<Widget> children,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
