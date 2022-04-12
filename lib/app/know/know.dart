import 'package:flutter/material.dart';
import 'package:rudaelmoslem/theme/app_color.dart';

import 'components/body.dart';

class KnowIslamic extends StatefulWidget {
  KnowIslamic({Key? key}) : super(key: key);

  @override
  _KnowIslamicState createState() => _KnowIslamicState();
}

class _KnowIslamicState extends State<KnowIslamic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.buckgrundColor,
      
      body: Body(),
    );
  }
}