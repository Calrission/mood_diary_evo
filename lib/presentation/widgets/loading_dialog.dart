import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class LoadingDialog extends StatelessWidget {

  const LoadingDialog({super.key});

  static Future<void> show ({
    required BuildContext context,
    bool barrierDismissible = false
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return LoadingDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        constraints: BoxConstraints(
          maxHeight: 200,
          maxWidth: 200
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              context.palette.blockShadow
            ],
          ),
          padding: const EdgeInsets.all(32),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}