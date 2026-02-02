import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_app_bar.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_mode_switcher.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/item_emote_widget.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extensions.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeModeCubit(),
      child: Scaffold(
        appBar: HomeAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Center(child: HomeModeSwitcher()),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: pagePadding),
                    child: Text(
                      "Что чувствуешь?",
                      style: TS.titleBlock.use(context.palette.text)
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                        ItemEmoteWidget(emote: Emotes.values[index]),
                      separatorBuilder: (_, _) => SizedBox(width: 12),
                      itemCount: Emotes.values.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                        left: pagePadding,
                        right: pagePadding,
                        bottom: 10
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}