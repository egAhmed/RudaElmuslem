import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/provider/settingsProvider.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final Map<String, ThemeMode> _themeOptions = {
    'setting.index.item1.text1'.tr(): ThemeMode.system,
    'setting.index.item1.text2'.tr(): ThemeMode.light,
    'setting.index.item1.text3'.tr(): ThemeMode.dark
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, value, child) {
        return Scaffold(
          body:  Container(
            child: Column(
              //direction: Axis.vertical,
              children: [
                Container(
                  height: 10.0.h,
                  width: 100.0.w,
                  //color: Colors.black12,
                  alignment: Alignment.center,
                  child: Text(
                    'setting.title'.tr(),
                    style: Theme.of(context).textTheme.headline1
                  ),
                ),
                Expanded(
                  child: Consumer<SettingProvider>(
                     builder: (context, setting, child) {
                       return ListView(
                         padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                         physics: BouncingScrollPhysics(),
                         children: [

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 1.0.h),
                              child: Text(
                                'setting.index.item1.title2'.tr(),
                                style: Theme.of(context).textTheme.headline5,
                              )),
                            buildThemeSetting(context ,),
                            SizedBox(height: 2.0.h),
                            
                         ],
                       );
                     }
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

   Widget buildThemeSetting(BuildContext context,) {
    //Text('prayetime.setting.department.item3.contant.title'.tr())
    return Consumer<ThemeController>(
      builder: (context, setting, child) {
        return Card(
          child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _themeOptions.length,
                itemBuilder: (context, index) {
                  return RadioListTile(//restr app
                      title: Text(
                        _themeOptions.keys.elementAt(index),
                        style: Theme.of(context).textTheme.subtitle2,
                        ),
                      subtitle:
                          index == 0 ?  Text( 
                            'setting.index.item1.text4'.tr(),
                            style: Theme.of(context).primaryTextTheme.subtitle2,) : null,
                      value: _themeOptions.values.elementAt(index),
                      groupValue: setting.themeMode,
                      onChanged: (dynamic value) {
                        setting.themeMode = value;
                      });
                },
              ),
        );
      }
    );
  }
}