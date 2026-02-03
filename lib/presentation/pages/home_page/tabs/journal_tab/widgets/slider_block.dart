import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';

class SliderBlock extends StatelessWidget {
  final bool enabled;
  final String leftLabel;
  final String rightLabel;
  final double value;
  final void Function(double) onChanged;

  const SliderBlock({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: context.palette.block,
        boxShadow: [context.palette.blockShadow]
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 10
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.filled(6, Container(
              width: 2,
              height: 8,
              decoration: BoxDecoration(
                color: context.palette.grey5,
                borderRadius: BorderRadius.circular(25)
              ),
            ))
          ),
          SizedBox(height: 2),
          Slider(
            value: value,
            padding: EdgeInsets.zero,
            onChanged: enabled ? onChanged : null,
          ),
          SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leftLabel, style: TS.label.use(context.palette.grey2)),
              Text(rightLabel, style: TS.label.use(context.palette.grey2)),
            ],
          )
        ],
      ),
    );
  }
}

class RingSliderThumbShape extends SliderComponentShape {

  final Color strokeColor;

  RingSliderThumbShape({required this.strokeColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(9);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center,
    {
      required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow
    }
  ) {
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    canvas.drawCircle(
      center, 9,
      Paint()..color = strokeColor,
    );
    canvas.drawCircle(
      center, 5,
      Paint()..color = colorTween.evaluate(enableAnimation)!,
    );
  }
}