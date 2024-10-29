import 'dart:convert';

import 'package:app/core/design/outline_button.dart';
import 'package:app/core/design/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailView extends StatefulWidget {
  const EmailView({super.key});

  @override
  State<EmailView> createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  final String msg =
      'شكراً لك على ثقتك بنا ومشاركتنا رأيك القيم حول تطبيقنا رأيك هو بمثابة هدية لنا، فهو يساعدنا على تطوير التطبيق ليكون من أفضل التطبيقاتً.\n لا تتردد في مشاركتنا أي أفكار أو اقتراحات تراها مناسبة، فنحن نعتبرك شريكاً حقيقياً في رحلتنا.';
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  late String dropDownValue = '';

  Future<void> sendEmail({
    required TextEditingController name,
    required TextEditingController title,
    required TextEditingController body,
  }) async {
    final encodedBody = utf8.encode(body.text);
    final decodedBody = utf8.decode(encodedBody);

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'recipe.reply1988@gmail.com',
      queryParameters: {
        'subject': Uri.encodeComponent(title.text),
        'body': decodedBody,
      },
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'التواصل',
            style: TextStyle(fontFamily: 'title_font'),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/email+page.jpg',
                  width: 260,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  msg,
                  style: TextStyle(
                      fontFamily: 'title_font',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 40.h),
              AppTextField(
                label: 'الاسم',
                hint: 'حقل اختياري',
                prefixType: PrefixType.username,
                controller: nameController,
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(8),
                height: 58,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: DropdownButton<String>(
                    hint: Text('حقل اجباري'),
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down),
                    borderRadius: BorderRadius.circular(8),
                    items: [
                      DropdownMenuItem(
                          child: Text('تقييم البرنامج'), value: 'Evaluation'),
                      DropdownMenuItem(
                          child: Text('اقتراحات للميزات الجديدة'),
                          value: 'Suggestions for new features'),
                      DropdownMenuItem(
                          child: Text('المشاركة في تطوير البرنامج'),
                          value: 'Participate in program development'),
                      DropdownMenuItem(
                          child: Text('مشاركة تجارب الاستخدام'),
                          value: 'Share user experiences'),
                      DropdownMenuItem(
                          child: Text(' تقديم الملاحظات'),
                          value: 'Submitting feedback'),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value!;
                        titleController.text = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              dropDownValue == ''
                  ? const SizedBox.shrink()
                  : dropDownValue == 'Evaluation'
                      ? _field('Evaluation')
                      : dropDownValue == 'Suggestions for new features'
                          ? _field('Suggestions for new features')
                          : dropDownValue ==
                                  'Participate in program development'
                              ? _field('Participate in program development')
                              : dropDownValue == 'Share user experiences'
                                  ? _field('Share user experiences')
                                  : _field('Submitting feedback'),
              SizedBox(height: 20.h),
              AppButton(
                label: 'Send mail',
                fillColor: Theme.of(context).colorScheme.primary,
                onPressed: () => sendEmail(
                  name: nameController,
                  title: titleController,
                  body: bodyController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String txt) {
    return AppTextField(
      controller: bodyController,
      label: txt,
      maxLines: 4,
    );
  }
}
