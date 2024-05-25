import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'alert_widget.dart';

class Alerts {
  static void showSuccess(BuildContext context, String message) {
    SnackBar snackBar = AlertWidget(
      color: Theme.of(context).colorScheme.error,
      backgroundColor: CustomColors.of(context).backgroundError,
      message: message,
    ).build(context);

    show(context, snackBar);
  }

  static void showFailure(BuildContext context, String message) {
    SnackBar snackBar = AlertWidget(
      color: Theme.of(context).colorScheme.error,
      backgroundColor: CustomColors.of(context).backgroundError,
      message: message,
    ).build(context);

    show(context, snackBar);
  }

  static void show(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
