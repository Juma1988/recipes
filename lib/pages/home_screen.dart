import 'dart:math';

import 'package:app/core/design/navigator.dart';
import 'package:app/core/design/show_msg.dart';
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
  final List<String> _branch = [
    'وجبات حفيفة',
    'وجبات رأيسية',
    'سلطات',
    'الصلصات',
    'حلويات',
    'مشروبات',
  ];
  final List<String> _images = [
    'assets/svg/breakfast.svg',
    'assets/svg/lunch.svg',
    'assets/svg/salad.svg',
    'assets/svg/sauces.svg',
    'assets/svg/sweet.svg',
    'assets/svg/drinks.svg',
  ];
  final List<Widget> _page = [
    // BreakfastView(),
    // LunchView(),
    // SaladView(),
    // SaucesView(),
    // SweetsView(),
    // DrinksView()
  ];
  final List<Widget> _detailsView = [
    // BreakfastDetailsView(itemNum: Random().nextInt(breakfast.length)),
    // LunchDetailsView(itemNum: Random().nextInt(lunch.length)),
    // SaladDetailsView(itemNum: Random().nextInt(salad.length)),
    // SaucesDetailsView(itemNum: Random().nextInt(sauces.length)),
    // SweetDetailsView(itemNum: Random().nextInt(sweets.length)),
    // DrinksDetailsView(itemNum: Random().nextInt(drinks.length)),
  ];

  final List<List> _modelList = [
    breakfast,
    lunch,
    salad,
    sauces,
    sweets,
    drinks
  ];

  final List<Color> _colors = [
    Colors.cyan,
    Colors.pinkAccent,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.green,
  ];
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
              const Text('هناكل ايه'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  appShowMsg('مكن الضغط مرتين لعمل اختيار عشوائي');
                },
              )
            ],
          ),
        )),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: GridView.builder(
            itemCount: _branch.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 300.w / 400.h),
            itemBuilder: (context, index) => InkWell(
              enableFeedback: true,
              autofocus: true,
              focusColor: _colors[index],
              onTap: () {
                AppGoto(
                  ViewPage(
                    categoryNumber: index,
                  ),
                );
              },
              onDoubleTap: () {
                AppGoto(DetailsView(
                  itemNumber: Random().nextInt(_modelList[index].length), categoryNumber: index,
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      _images[index],
                      width: 60.w,
                      height: 60.h,
                      colorFilter:
                          ColorFilter.mode(_colors[index], BlendMode.srcIn),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      _branch[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                        fontFamily: 'font',
                        color: _colors[index],
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
