import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/domain/cubit/app_cubit.dart';
import 'package:muslim/domain/states/app_states.dart';
import 'package:muslim/presentation/custom_widgets/archive_card.dart';
import 'package:muslim/presentation/custom_widgets/emty_archive.dart';
import 'package:muslim/presentation/manager/colors_manager.dart';

class Archive extends StatelessWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          color: ColorsManager.primaryBackground,
          child: cubit.allMarks.isEmpty
              ? const EmptyArchive()
              : ListView.builder(
                  itemCount: cubit.allMarks.length,
                  itemBuilder: (c, index) {
                    var currentMark = cubit.allMarks[index];
                    return ArchiveCard(
                      surahNumber: currentMark['surahNumber'],
                      verseNumber: currentMark['verseNumber'],
                      id: currentMark['id'],
                    );
                  },
                ),
        );
      },
    );
  }
}


