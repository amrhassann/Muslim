
import 'package:flutter/material.dart';
import 'package:muslim/data/models/surah_model.dart';
import 'package:muslim/presentation/manager/assets_manager/images.dart';
import 'package:muslim/presentation/screens/ayat.dart';

import '../manager/colors_manager.dart';
import '../manager/style_manager.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({Key? key, required this.surah, required this.index})
      : super(key: key);
  final SurahModel surah;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>AyatScreen(surahNumber: index + 1,haveMark: false,)));

      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(ImagesManager.vector),
            const SizedBox(width: 7,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.name,
                  style: getBoldStyle(color: ColorsManager.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'رقم السورة: ${index + 1}',
                  style: getLightStyle(color: ColorsManager.grey, fontSize: 15),
                )
              ],
            ),
            const Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.placeOfRevelation,
                  style: getLightStyle(color: ColorsManager.primaryColor, fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'عدد الأيات: ${surah.verseCount + 1}',
                  style: getLightStyle(color: ColorsManager.grey, fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
