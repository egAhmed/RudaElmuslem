import 'package:flutter/material.dart';
import 'package:rudaelmoslem/theme/app_color.dart';

import 'components/bodt.dart';

class InfoApp extends StatefulWidget {
  InfoApp({Key? key}) : super(key: key);

  @override
  _InfoAppState createState() => _InfoAppState();
}

class _InfoAppState extends State<InfoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorUtil.buckgrundColor,
      body: Body(),
    );
  }
}