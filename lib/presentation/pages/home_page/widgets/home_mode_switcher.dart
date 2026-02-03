import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_diary_evo_test/core/widgets/app_ink_well.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_mode_cubit/home_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class HomeModeSwitcher extends StatelessWidget {
  const HomeModeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeModeCubit>();
    return Container(
      decoration: BoxDecoration(
        color: context.palette.grey4,
        borderRadius: BorderRadius.circular(47),
      ),
      child: BlocBuilder<HomeModeCubit, HomeModeState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ItemHomeModeSwitcher(
                iconPath: "assets/icons/journal.svg",
                title: "Дневник настроения",
                isSelected: state == HomeModeState.journal,
                onTap: () {
                  cubit.toJournal();
                },
              ),
              _ItemHomeModeSwitcher(
                iconPath: "assets/icons/stats.svg",
                title: "Статистика",
                isSelected: state == HomeModeState.statistic,
                onTap: () {
                  cubit.toStatistic();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ItemHomeModeSwitcher extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ItemHomeModeSwitcher({
    required this.iconPath,
    required this.title,
    required this.isSelected,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? context.palette.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? context.palette.textOnAccent
                    : context.palette.grey2,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TS.tab.use(
                isSelected
                  ? context.palette.textOnAccent
                  : context.palette.grey2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}