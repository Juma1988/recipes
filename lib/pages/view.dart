import 'dart:math';

import 'package:app/core/design/navigator.dart';
import 'package:app/pages/details_view.dart';
import 'package:app/pages/models/model01_breakfast.dart';
import 'package:app/pages/models/model02_lunch.dart';
import 'package:app/pages/models/model03_salad.dart';
import 'package:app/pages/models/model04_sauces.dart';
import 'package:app/pages/models/model05_sweets.dart';
import 'package:app/pages/models/model06_drinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewPage extends StatefulWidget {
  final int categoryNumber ;
  const ViewPage({
    super.key, required this.categoryNumber
  });

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final List<String> _branch = [
    'وجبات حفيفة',
    'وجبات رأيسية',
    'سلطات',
    'الصلصات',
    'حلويات',
    'مشروبات',
  ];
  final List<List> _modelList = [
    breakfast,
    lunch,
    salad,
    sauces,
    sweets,
    drinks
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: const Drawer(

          ),
            appBar: AppBar(
              title: Text(_branch[widget.categoryNumber]),
            ),
            floatingActionButton: FloatingActionButton(
              child: SvgPicture.asset('assets/images/dont_know.svg'),
              onPressed: () {
                AppGoto(DetailsView(
                  itemNumber: Random()
                      .nextInt(_modelList[widget.categoryNumber].length),
                  categoryNumber: widget.categoryNumber,
                ));
              },
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8.w,
                childAspectRatio: 200 / 70,
                mainAxisSpacing: 8.h,
              ),
              padding: EdgeInsets.all(8.r),
              itemCount: _modelList[widget.categoryNumber].length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  AppGoto(DetailsView(
                      itemNumber: index,
                      categoryNumber: widget.categoryNumber));
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 4),
                    ],
                  ),
                  child: Row(
                    children: [
                      ///Container 01
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.r).copyWith(
                                  topRight: Radius.circular(8.r),
                                  bottomRight: Radius.circular(8.r))),
                          child: Image.asset(
                            _modelList[widget.categoryNumber][index]['image'],
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),

                      ///Container 02
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      _modelList[widget.categoryNumber][index]
                                          ['title_ar'],
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'font01',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _modelList[widget.categoryNumber]
                                                  [index]['stats'] =
                                              !_modelList[widget.categoryNumber]
                                                  [index]['stats'];
                                        });
                                      },
                                      icon: Icon(
                                        !_modelList[widget.categoryNumber]
                                                [index]['stats']
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        color: Colors.redAccent,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 6),
                                        height: 20,
                                        width: 75,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        child: Text(
                                            'المستوي : ${_modelList[widget.categoryNumber][index]['level']}'),
                                      ),
                                    ),
                                    const SizedBox(width: 9),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 6),
                                        height: 20,
                                        width: 75,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        child: Text(
                                            'مدة التحضير ${_modelList[widget.categoryNumber][index]['prep_time']}'),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.h),
                                        height: 20.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        child: Text(
                                            'عدد المقادير  ${(_modelList[widget.categoryNumber][index]['ingredients'] as List?)?.length ?? 0}'),
                                      ),
                                    ),
                                    SizedBox(width: 9.w),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.r),
                                        height: 20.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        child: Text(
                                            'مده الطهو ${_modelList[widget.categoryNumber][index]['cook_time']}'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
