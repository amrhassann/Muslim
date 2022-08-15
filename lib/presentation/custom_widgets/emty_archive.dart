import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslim/presentation/manager/colors_manager.dart';
import 'package:muslim/presentation/manager/style_manager.dart';

class EmptyArchive extends StatelessWidget {
  const EmptyArchive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/json/nodata.json',repeat: true),
          Text(
            'لا يوجد علامات',
            style: getLightStyle(color: ColorsManager.primaryColor, fontSize: 18),
          )
        ],
      ),
    );
  }
}