import 'package:muslim/data/models/surah_model.dart';
import 'package:quran/quran.dart' as quran;

class QuraanServices{
  int totalSurahCount = 114;
  List<SurahModel> allSurah = [];

 // start getRevelationPlace
  String _getRevelationPlace (int i) {
    if(quran.getPlaceOfRevelation(i).toUpperCase() == 'Makkah'.toUpperCase()){
      return 'مكية';
    }else if(quran.getPlaceOfRevelation(i).toUpperCase() == 'Madinah'.toUpperCase() || quran.getPlaceOfRevelation(i) == 'Manidah'){
      // here is exception statement because there is wrong in surah number 72, it return 'Manidah' not Madinah
      return 'مدنية';
    }else{
      return ' ';
    }
  }
  // end getRevelationPlace


  // start getting all surah details
  List<SurahModel> getAllSurahName(){
    for(int i=1; i<=totalSurahCount;i++){
      allSurah.add(
          SurahModel(
              name: quran.getSurahNameArabic(i).toString(),
              placeOfRevelation: _getRevelationPlace(i),
              verseCount: quran.getVerseCount(i)
          )
      );
    }
    return allSurah;
  }
 // end getting all surah details
}
