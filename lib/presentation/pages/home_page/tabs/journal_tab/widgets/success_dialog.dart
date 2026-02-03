import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class SuccessDialog extends StatelessWidget {

  const SuccessDialog({super.key});

  static Future<void> show ({
    required BuildContext context,
    bool barrierDismissible = true
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return SuccessDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: BoxConstraints(
        maxHeight: 220,
        maxWidth: 220
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            context.palette.blockShadow
          ],
        ),
        padding: const EdgeInsets.all(32),
        child: Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/happy.png", height: 100),
            SizedBox(height: 8),
            Text(
              "Успешно отправлено",
              style: TS.titleBlock.use(context.palette.text),
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ),
    );
  }
}