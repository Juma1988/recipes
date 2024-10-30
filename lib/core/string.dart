import 'package:app/pages/models/model01_breakfast.dart';
import 'package:app/pages/models/model02_lunch.dart';
import 'package:app/pages/models/model03_salad.dart';
import 'package:app/pages/models/model04_sauces.dart';
import 'package:app/pages/models/model05_sweets.dart';
import 'package:app/pages/models/model06_drinks.dart';
import 'package:flutter/material.dart';

final List<String> referencesList = [
  'اصوات مصرية',
  'شيماء شربي ',
  'مطبخ شيرين',
];
final List<String> referencesUrl = [
  'https://www.facebook.com/Gehadd.Hassann',
  'https://www.facebook.com/profile.php?id=61565498805414',
  'https://www.facebook.com/profile.php?id=100064057717311'
];
final List<String> referencesProfileImage = [
  'https://scontent.fcai22-4.fna.fbcdn.net/v/t39.30808-6/461747479_905458671442628_1282770399515837123_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=5BmjuCu_xc4Q7kNvgG_H06m&_nc_zt=23&_nc_ht=scontent.fcai22-4.fna&_nc_gid=AiLIkD6Sriijvv38i1-50Aw&oh=00_AYAz4uZ0Uxb5Q6rg0ULjgpETZHu2epTu7X0x_C7zwA5f_Q&oe=67271643',
  'https://scontent.fcai22-4.fna.fbcdn.net/v/t39.30808-6/459988036_122106269702516626_8136793535164989031_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=EzHZbPPdVGIQ7kNvgFWW4K3&_nc_zt=23&_nc_ht=scontent.fcai22-4.fna&_nc_gid=ATjFQq0ceJBL6amtCBp5J0z&oh=00_AYAh_SlrkicE2OvRmgKLlVJIAAivibf2N4bpxguOP96vmg&oe=672706AC',
  'https://scontent.fcai22-4.fna.fbcdn.net/v/t39.30808-6/426179602_788853966593187_3486882243457960243_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=6O6TwBVGY2cQ7kNvgGNauBV&_nc_zt=23&_nc_ht=scontent.fcai22-4.fna&_nc_gid=AoYnaBI3D42vzhpkQgo1AX5&oh=00_AYA4W8el6ddmUiK6qlnryFomixNN5SiKkgaYAZ92_wkYqQ&oe=67271EBB'
];

final List<List> modelList = [breakfast, lunch, salad, sauces, sweets, drinks];
final List<String> branch = [
  'وجبات حفيفة',
  'وجبات رئيسية',
  'سلطات',
  'الصلصات',
  'حلويات',
  'مشروبات',
];
final List<String> images = [
  'assets/svg/breakfast.svg',
  'assets/svg/lunch.svg',
  'assets/svg/salad.svg',
  'assets/svg/sauces.svg',
  'assets/svg/sweet.svg',
  'assets/svg/drinks.svg',
];


final List<Color> colorsDrawer = [
  Colors.cyan,
  Colors.pinkAccent,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.green,
  Colors.deepPurple,
  Colors.amber,
];
final List<String> branchDrawer = [
  'وجبات حفيفة',
  'وجبات رئيسية',
  'سلطات',
  'الصلصات',
  'حلويات',
  'مشروبات',
  'للتواصل و للاضافة و التعديل',
  'مصادر',
];

final List<String> imagesDrawer = [
  'assets/svg/breakfast.svg',
  'assets/svg/lunch.svg',
  'assets/svg/salad.svg',
  'assets/svg/sauces.svg',
  'assets/svg/sweet.svg',
  'assets/svg/drinks.svg',
  'assets/svg/request.svg',
  'assets/svg/source.svg',
];
