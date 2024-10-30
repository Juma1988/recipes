import 'package:app/core/design/show_msg.dart';
import 'package:app/core/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferencesView extends StatelessWidget {
  ReferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'مراجع',
                style: TextStyle(fontFamily: 'title_font'),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    appShowMsg('يمكن النقر علي الصورة للوصول الي الصفحة');
                  },
                  icon: Icon(Icons.info_outline))
            ],
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: 3,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 200 / 300,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          itemBuilder: (context, index) => InkWell(
            onTap: () => launch(referencesUrl[index]),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4),
                ],
              ),
              child: Column(
                children: [
                  Container(
                      child: Image.network(referencesProfileImage[index]),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r).copyWith(
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0)),
                      )),
                  SizedBox(height: 16.h),
                  Expanded(
                      child: Text(
                        referencesList[index],
                    style: TextStyle(
                        fontFamily: 'title_font',
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
