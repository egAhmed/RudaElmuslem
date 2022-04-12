import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = (Platform.isAndroid)
        ? CircularProgressIndicator()
        : CupertinoActivityIndicator();
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          //color: Color(0xffd6d6d6),
          alignment: Alignment.center,
          child: widget,
        );
      }
    );
  }
}