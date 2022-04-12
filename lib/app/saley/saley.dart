import 'package:flutter/material.dart';
import 'package:rudaelmoslem/theme/app_color.dart';

import 'coponents/body.dart';

class SaleyScreen extends StatefulWidget {
  SaleyScreen({Key? key}) : super(key: key);

  @override
  _SaleyScreenState createState() => _SaleyScreenState();
}

class _SaleyScreenState extends State<SaleyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: ColorUtil.buckgrundColor,
      body: Body(),
    );
  }
}