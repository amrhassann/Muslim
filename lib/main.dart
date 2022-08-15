import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/domain/cubit/app_cubit.dart';
import 'package:muslim/presentation/manager/assets_manager/fonts.dart';
import 'package:muslim/presentation/manager/colors_manager.dart';
import 'package:muslim/presentation/screens/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // provide AppCubit and call onOpenApp method
      create: (context) => AppCubit()..onOpenApp(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: FontsManager.urw,
            primaryColor: ColorsManager.primaryColor,
            appBarTheme: AppBarTheme(
              color: ColorsManager.primaryColor,
            )
          ),
          home: HomeLayout()),
    );
  }
}
