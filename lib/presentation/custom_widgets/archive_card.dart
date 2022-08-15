import 'package:flutter/material.dart';
import 'package:muslim/domain/cubit/app_cubit.dart';
import 'package:muslim/presentation/manager/colors_manager.dart';
import 'package:muslim/presentation/manager/style_manager.dart';
import 'package:muslim/presentation/screens/ayat.dart';
import 'package:quran/quran.dart' as quran;

class ArchiveCard extends StatelessWidget {
  const ArchiveCard(
      {Key? key,
      required this.surahNumber,
      required this.verseNumber,
      required this.id})
      : super(key: key);

  final int surahNumber;
  final int verseNumber;
  final int id;
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var cubit = AppCubit.get(context);
    return Dismissible(
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'حذف العلامة',
            style: getLightStyle(color: ColorsManager.white, fontSize: 14),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      crossAxisEndOffset: 0,
      onDismissed: (direction) {
        try{
          cubit.deleteTask(id: id);

        }catch(e){
          print(e);
        }
      },
      key:  Key(id.toString()),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => AyatScreen(
                        surahNumber: surahNumber,
                        haveMark: true,
                        markedVerse: verseNumber,
                      )));
        },
        child: Container(
            width: deviceWidth * .9,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quran.getSurahNameArabic(surahNumber),
                  style:
                      getLightStyle(color: ColorsManager.black, fontSize: 14),
                ),
                Text(
                  quran.getVerse(surahNumber, verseNumber),
                  style: getQuraanStyle(
                      color: ColorsManager.primaryColor, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
      ),
    );
  }
}
