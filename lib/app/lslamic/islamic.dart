import 'package:flutter/material.dart';
import 'package:rudaelmoslem/theme/app_color.dart';

import 'components/body.dart';

class IslamicLbrary extends StatefulWidget {
  IslamicLbrary({Key? key}) : super(key: key);

  @override
  _IslamicLbraryState createState() => _IslamicLbraryState();
}

class _IslamicLbraryState extends State<IslamicLbrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}