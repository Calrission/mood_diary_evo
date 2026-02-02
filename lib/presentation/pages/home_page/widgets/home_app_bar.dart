import 'package:datetime_loop/datetime_loop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_diary_evo_test/core/extensions/date_time_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extensions.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: appBarTopOffset,
        left: pagePadding,
        right: pagePadding,
        bottom: appBarBottomOffset
      ),
      child: Row(
        children: [
          SizedBox.square(dimension: 24),
          Expanded(
            child: DateTimeLoopBuilder(
              timeUnit: TimeUnit.minutes,
              builder: (context, dateTime, child) {
                return Text(
                  dateTime.ddMMMMHHmm(),
                  textAlign: TextAlign.center,
                  style: TS.title.use(context.palette.grey2),
                );
              }
          )),
          SvgPicture.asset("assets/icons/calendar.svg")
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}