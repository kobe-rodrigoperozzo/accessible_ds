import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class DsSnackBar extends SnackBar {
  DsSnackBar({
    Key? key,
    required String text,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    Function()? onPressed,
  }) : super(
          key: key,
          content: Semantics(
            liveRegion: true, // screen reader will announce this
            child: Text(text),
          ),
          duration: duration,
          action: actionLabel != null ? SnackBarAction(label: actionLabel, onPressed: onPressed ?? () {}) : null,
        ) {
    SemanticsService.announce(text, TextDirection.ltr);
  }
}
