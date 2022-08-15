import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/domain/cubit/app_cubit.dart';
import 'package:muslim/domain/states/app_states.dart';
import 'package:muslim/presentation/manager/colors_manager.dart';
import 'package:muslim/presentation/manager/style_manager.dart';
import 'package:quran/quran.dart' as quran;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AyatScreen extends StatefulWidget {
  AyatScreen(
      {Key? key,
      required this.surahNumber,
      required this.haveMark,
      this.markedVerse})
      : super(key: key);
  final int surahNumber;
  final bool haveMark;
  int? markedVerse;
  @override
  State<AyatScreen> createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (widget.haveMark) {
        itemScrollController.scrollTo(
            index: widget.markedVerse!, duration: const Duration(seconds: 1));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(quran.getSurahNameArabic(widget.surahNumber)),
          centerTitle: true,
        ),
        body: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حجم الخط',
                    style: getRegularStyle(
                        color: ColorsManager.primaryColor, fontSize: 15),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                  Slider(
                    activeColor: ColorsManager.primaryColor,
                    value: cubit.ayatFontSize,
                    max: 25,
                    min: 12,
                    label: 'حجم الخط',
                    onChanged: (double value) =>
                        cubit.changeAyatFontSize(value),
                  ),
                  Expanded(
                    child: ScrollablePositionedList.separated(
                      itemScrollController: itemScrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: quran.getVerseCount(widget.surahNumber) + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Text(
                            ' ${quran.getBasmala()}',
                            textAlign: TextAlign.center,
                            style: getLightStyle(
                                color: ColorsManager.black,
                                fontSize: cubit.ayatFontSize),
                          );
                        } else {
                          return InkWell(
                            onLongPress: () {
                              if (index != widget.markedVerse) {
                                ayaOnLongPress(context, cubit, index);
                              }
                            },
                            child: Text(
                              ' ${quran.getVerse(widget.surahNumber, index, verseEndSymbol: true)}',
                              textAlign: TextAlign.center,
                              style: getQuraanStyle(
                                  color: index == widget.markedVerse
                                      ? ColorsManager.primaryColor
                                      : ColorsManager.black,
                                  fontSize: cubit.ayatFontSize),
                            ),
                          );
                        }
                      },
                      separatorBuilder: (c, i) => Container(
                        height: 5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> ayaOnLongPress(
      BuildContext context, AppCubit cubit, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: InkWell(
              onTap: () {
                cubit.insertToDatabase(
                    surahNumber: widget.surahNumber, verseNumber: index);
                setState(() {
                  widget.markedVerse = index;
                });
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Center(
                    child: Text(
                  'إضافة علامة على الاية',
                  style: getMediumStyle(
                      color: ColorsManager.primaryColor, fontSize: 16),
                )),
              ),
            ),
          );
        });
  }
}
