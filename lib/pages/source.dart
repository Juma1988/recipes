import 'package:flutter/material.dart';

class ReferencesView extends StatelessWidget {
  const ReferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مراجع',
          style: TextStyle(fontFamily: 'title_font'),
        ),
      ),
    );
  }
}
