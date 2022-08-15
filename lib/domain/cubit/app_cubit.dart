import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/data/models/surah_model.dart';
import 'package:muslim/data/services/quraan_services.dart';
import 'package:muslim/domain/states/app_states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // cubit static getter
  static AppCubit get(context) => BlocProvider.of(context);

  final QuraanServices _quraanServices = QuraanServices();
  List<SurahModel> allSurah = [];
  TextEditingController searchController = TextEditingController();
  double ayatFontSize = 18.0;
  List allMarks = [];
  late Database dataBase;

  //start change font size using slider
  changeAyatFontSize(value) {
    ayatFontSize = value;
    emit(ChangeFontSizeState());
  }
  // end change font size using slider

  //start create database
  void createDataBase() {
    openDatabase('marks.db', version: 1, onCreate: (database, version) {
      database
          .execute(
              'create table marks (id integer PRIMARY KEY , surahNumber integer , verseNumber integer , haveMark TEXT)')
          .then((value) => () {
                log('table created');
              })
          .catchError((theError) {
        log('creating table error => ${theError.toString()}');
      });
    }, onOpen: (dataBase) {
      getDataFromDb(dataBase);
    }).then((value) {
      dataBase = value;
      emit(DatabaseCreateState());
    });
  }
//end create database

//start database insert

  void insertToDatabase({
    required int surahNumber,
    required int verseNumber,
  }) async {
    await dataBase.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO marks (surahNumber , verseNumber , haveMark) VALUES("$surahNumber","$verseNumber","true")')
          .then((value) {
        log("inserting to table done");
        emit(DatabaseInsertState());
        getDataFromDb(dataBase);
      }).catchError((error) {
        log('inserting to table error => ${error.toString()}');
      });
    });
  }
//end database insert

//start get data from database
  getDataFromDb(dataBase) {
    allMarks = [];
    dataBase.rawQuery('SELECT * FROM marks').then((value) {
      log('getting data done successfully');
      allMarks.addAll(value);
      emit(GetDataFromDatabaseState());
    });
  }
//end get data from database

//start delete from database
  void deleteTask({required int id}) {
    dataBase.rawDelete('DELETE FROM marks WHERE id = ?', [id]).then((value) {
      getDataFromDb(dataBase);
      emit(DeleteMarkState());
    });
  }
//end delete from database


// start onOpenApp
// we will call this method when we provide this cubit 'MyApp class'
  onOpenApp() {
    allSurah = _quraanServices.getAllSurahName();
    createDataBase();
  }
  // end onOpenApp
}
