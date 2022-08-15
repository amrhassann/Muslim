import 'package:flutter/material.dart';
import 'package:muslim/domain/cubit/app_cubit.dart';
import 'package:muslim/presentation/custom_widgets/surah_item.dart';
import 'package:muslim/presentation/manager/colors_manager.dart';

class Surah extends StatelessWidget {
  const Surah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: ColorsManager.primaryBackground,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: cubit.allSurah.length,
        itemBuilder: (context, index) {
          return SurahItem(
            surah: cubit.allSurah[index],
            index: index,
          );
        },
        separatorBuilder: (c, i) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
