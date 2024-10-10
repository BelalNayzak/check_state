library check_state;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'default_loader.dart';
part 'default_err.dart';

class CheckState extends StatelessWidget {
  static late Widget defaultErrWidget;
  static late Widget defaultLoaderWidget;

  final bool? isError;
  final bool? isLoading;
  final Widget? customErrWidget;
  final Widget? child;
  final Widget? customLoaderWidget;
  final bool? canRetry;
  final void Function()? onClickRetry;

  CheckState({
    super.key,
    required this.isError,
    required this.isLoading,
    required this.child,
    this.customErrWidget,
    this.customLoaderWidget,
    this.canRetry,
    this.onClickRetry,
  }) {
    defaultErrWidget ??= const DefaultErr();
    defaultLoaderWidget ??= const DefaultLoader();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _getHome(),
    );
  }

  // Method to set default widgets
  static void setDefaultWidgets({required Widget errWidget, required Widget loaderWidget}) {
    defaultErrWidget = errWidget;
    defaultLoaderWidget = loaderWidget;
  }

  Widget _getHome() {
    if (isLoading == true) {
      return customLoaderWidget ?? defaultLoaderWidget!; // Use custom or default loader
    } else if (isError == true) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customErrWidget ?? defaultErrWidget!, // Use custom or default error widget
          if (canRetry ?? false) IconButton(onPressed: onClickRetry, icon: const Icon(Icons.refresh)),
        ],
      );
    } else {
      return child ?? const SizedBox(); // Ensure a non-null widget for success
    }
  }
}
