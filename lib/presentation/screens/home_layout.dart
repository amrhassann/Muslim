import 'package:flutter/material.dart';
import 'package:muslim/domain/cubit/app_cubit.dart';
import 'package:muslim/presentation/manager/colors_manager.dart';
import 'package:muslim/presentation/screens/archive.dart';
import 'package:muslim/presentation/screens/surah.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom:  TabBar(
              indicatorColor: ColorsManager.white,
              tabs: const [
                Tab(text: 'السور',),
                Tab(text: 'المحفوظات',),
              ],
            ),
            title: const Text('القران الكريم'),
            centerTitle: true,
          ),
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Surah(),
              Archive()
            ],
          ),
        ),
      ),
    );
  }
}
