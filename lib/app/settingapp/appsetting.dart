import 'package:flutter/material.dart';

import 'coponents/body.dart';

class AppSetting extends StatefulWidget {
  AppSetting({Key? key}) : super(key: key);

  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}