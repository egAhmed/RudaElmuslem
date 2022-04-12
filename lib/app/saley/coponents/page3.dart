import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class Page3 extends StatefulWidget {
  Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon((CupertinoIcons.check_mark_circled),
                  size: 80.0.sp,
                  color: Theme.of(context).primaryColor,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'salyapp.page3.title'.tr(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'salyapp.page3.detil'.tr(),
                      style:Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                  ),
            ],
          ),
        );
      }
    );
  }
}