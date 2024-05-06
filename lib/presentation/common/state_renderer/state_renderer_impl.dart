import 'package:clean_arc_project/app/constants.dart';
import 'package:clean_arc_project/presentation/common/state_renderer/state_renderer.dart';
import 'package:clean_arc_project/presentation/resources/strings_manger.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

// Loading State (Popup, Full screen)
class LoadingState extends FlowState {
  LoadingState({
    required this.stateRendererType,
    this.message = AppStrings.loading,
  });

  final StateRendererType stateRendererType;
  final String message;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Error State (Popup, Full screen)
class ErrorState extends FlowState {
  ErrorState({
    required this.stateRendererType,
    required this.message,
  });

  final StateRendererType stateRendererType;
  final String message;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Content State
class ContentState extends FlowState {
  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

// Empty State
class EmptyState extends FlowState {
  EmptyState({
    required this.message,
  });

  final String message;
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget({
    required BuildContext context,
    required Widget screenContent,
    required Function retryActionFunction,
  }) {
    switch (runtimeType) {
      case LoadingState:
        if (getStateRendererType() == StateRendererType.popupLoadingState) {
          showPopup(
            context: context,
            stateRendererType: getStateRendererType(),
            message: getMessage(),
          );
          return screenContent;
        } else {
          return StateRenderer(
            message: getMessage(),
            stateRendererType: getStateRendererType(),
            retryActionFunction: retryActionFunction,
          );
        }
      case ErrorState:
        dismissDialog(
          context: context,
        );
        if (getStateRendererType() == StateRendererType.popupErrorState) {
          showPopup(
            context: context,
            stateRendererType: getStateRendererType(),
            message: getMessage(),
          );
          return screenContent;
        } else {
          return StateRenderer(
            message: getMessage(),
            stateRendererType: getStateRendererType(),
            retryActionFunction: retryActionFunction,
          );
        }
      case ContentState:
        dismissDialog(
          context: context,
        );
        return screenContent;
      case EmptyState:
        return StateRenderer(
          retryActionFunction: () {},
          stateRendererType: getStateRendererType(),
          message: getMessage(),
        );
      default:
        dismissDialog(
          context: context,
        );
        return screenContent;
    }
  }

  bool _isCurrentDialogShowing({
    required BuildContext context,
  }) =>
      ModalRoute.of(context)?.isCurrent != true;

  void dismissDialog({
    required BuildContext context,
  }) {
    if (_isCurrentDialogShowing(context: context)) {
      Navigator.of(
        context,
        rootNavigator: true,
      ).pop(true);
    }
  }

  void showPopup({
    required BuildContext context,
    required StateRendererType stateRendererType,
    required String message,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
            stateRendererType: stateRendererType,
            message: message,
            retryActionFunction: () {},
          ),
        );
      },
    );
  }
}
