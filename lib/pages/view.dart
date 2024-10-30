import 'dart:math';

import 'package:app/core/design/navigator.dart';
import 'package:app/core/string.dart';
import 'package:app/pages/details_view.dart';
import 'package:app/pages/email.dart';
import 'package:app/pages/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewPage extends StatefulWidget {
  final int categoryNumber;

  const ViewPage({super.key, required this.categoryNumber});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            drawer: Drawer(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 50.h),
                child: ListView.separated(
                  itemCount: branchDrawer.length,
                  separatorBuilder: (context, index) => SizedBox(height: 24.h),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      if (index < 6) {
                        AppGoto(ViewPage(
                          categoryNumber: index,
                        ));
                      } else if (index == 6) {
                        AppGoto(EmailView());
                      } else if (index == 7) {
                        AppGoto(ReferencesView());
                      } else {
                        null;
                      }
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: SvgPicture.asset(
                            imagesDrawer[index],
                            colorFilter: ColorFilter.mode(
                                colorsDrawer[index], BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(width: 24.w),
                        Text(
                          '${branchDrawer[index]}',
                          style: TextStyle(
                              fontFamily: 'title_font',
                              fontSize: 16,
                              color: colorsDrawer[index]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              title: Text(branch[widget.categoryNumber]),
            ),
            floatingActionButton: FloatingActionButton(
              child: SvgPicture.asset('assets/images/dont_know.svg'),
              onPressed: () {
                AppGoto(DetailsView(
                  itemNumber:
                      Random().nextInt(modelList[widget.categoryNumber].length),
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
              itemCount: modelList[widget.categoryNumber].length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  AppGoto(DetailsView(
                      itemNumber: index,
                      categoryNumber: widget.categoryNumber));
                },
                child: Container(
                  height: 70.h,
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
                            modelList[widget.categoryNumber][index]['image'],
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
                                      modelList[widget.categoryNumber][index]
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
                                          modelList[widget.categoryNumber]
                                                  [index]['stats'] =
                                              !modelList[widget.categoryNumber]
                                                  [index]['stats'];
                                        });
                                      },
                                      icon: Icon(
                                        !modelList[widget.categoryNumber][index]
                                                ['stats']
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
                                      child: _customContainer(
                                          txt:
                                              'المستوي : ${modelList[widget.categoryNumber][index]['level']}'),
                                    ),
                                    const SizedBox(width: 9),
                                    Expanded(
                                      child: _customContainer(
                                          txt:
                                              'مدة التحضير ${modelList[widget.categoryNumber][index]['prep_time']} د'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: _customContainer(
                                          txt:
                                              'عدد المقادير  ${(modelList[widget.categoryNumber][index]['ingredients'] as List?)?.length ?? 0}'),
                                    ),
                                    SizedBox(width: 9.w),
                                    Expanded(
                                      child: _customContainer(
                                          txt:
                                              'مدة الطهو ${modelList[widget.categoryNumber][index]['cook_time']} د'),
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

  Widget _customContainer({required String txt}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.r),
      height: 20.h,
      width: 75.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Text(txt),
    );
  }
}
