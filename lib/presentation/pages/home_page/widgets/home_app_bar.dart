import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_datetime_cubit/home_datetime_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/bloc/journal_bloc/journal_bloc.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
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
            child: BlocConsumer<HomeDateTimeCubit, HomeDateTimeState>(
              builder: (context, state){
                return Text(
                  state.display,
                  textAlign: TextAlign.center,
                  style: TS.title.use(context.palette.grey2),
                );
              },
              listener: (context, state){
                context.read<JournalBloc>().add(
                  SetDateTimeJournalEvent(dateTime: state.dateTime)
                );
              },
            )
          ),
          GestureDetector(
            onTap: (){
              // @TODO
              context.read<HomeDateTimeCubit>().setDateTime(
                DateTime.now().add(Duration(days: 1))
              );
            },
            child: SvgPicture.asset("assets/icons/calendar.svg")
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}