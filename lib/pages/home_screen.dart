import 'dart:math';

import 'package:app/core/design/navigator.dart';
import 'package:app/core/design/show_msg.dart';
import 'package:app/core/string.dart';
import 'package:app/pages/details_view.dart';
import 'package:app/pages/models/model01_breakfast.dart';
import 'package:app/pages/models/model02_lunch.dart';
import 'package:app/pages/models/model03_salad.dart';
import 'package:app/pages/models/model04_sauces.dart';
import 'package:app/pages/models/model05_sweets.dart';
import 'package:app/pages/models/model06_drinks.dart';
import 'package:app/pages/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final int categoryNumber;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: Center(
          child: Row(
            children: [
              Text('هناكل ايه'),
              Spacer(),
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  appShowMsg('يمكن الضغط مرتين لعمل اختيار عشوائي');
                },
              )
            ],
          ),
        )),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: GridView.builder(
            itemCount: branch.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 300.w / 400.h),
            itemBuilder: (context, index) => InkWell(
              enableFeedback: true,
              autofocus: true,
              focusColor: colorsDrawer[index],
              onTap: () {
                AppGoto(
                  ViewPage(
                    categoryNumber: index,
                  ),
                );
              },
              onDoubleTap: () {
                AppGoto(DetailsView(
                  itemNumber: Random().nextInt(modelList[index].length),
                  categoryNumber: index,
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      images[index],
                      width: 60.w,
                      height: 60.h,
                      colorFilter:
                          ColorFilter.mode(colorsDrawer[index], BlendMode.srcIn),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      branch[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                        fontFamily: 'font',
                        color: colorsDrawer[index],
                      ),
                    ),
                  ], // This is the line where the closing bracket was missing
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
