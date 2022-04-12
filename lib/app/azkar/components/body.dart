import 'dart:convert';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/azkar/azkar_dtils.dart';
import 'package:rudaelmoslem/bloc/azkar.dart';
import 'package:rudaelmoslem/custom_painter/azkar_painter.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'card_list.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  late AzkarAPI  _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AzkarAPI();
  }

  @override
  Widget build(BuildContext context) {
     Locale  locale = Localizations.localeOf(context);
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Scaffold(
          //backgroundColor: ColorUtil.buckgrundColor,
          body:  Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  //color: Colors.black26,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ClipPath(
                      clipper: AzkarClipper(),
                      child: Container(
                        color: value.themeMode == ThemeMode.dark?Colors.white12: ColorUtil.minColor1,
                        height: 30.0.h,
                        width: 100.0.w,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10.0.w,
                              bottom: 10.0.h,
                              child: SvgPicture.asset(
                                'assets/svg/001-window.svg',
                                height: 10.0.h,
                                width: 10.0.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.0.h,),
                Container(
                  //color: Colors.black26,
                  padding: EdgeInsets.symmetric(horizontal: 9.0.w),
                  width: 90.0.w,
                  //alignment: Alignment.centerLeft,
                  child: Text(
                    'azkar.title'.tr(),//Azkar El Muslim',
                    style: locale.countryCode =='EG'? Theme.of(context).textTheme.headline1:
                    Theme.of(context).textTheme.headline2
                  ),
                ),
                SizedBox(height: 2.0.h,),
                Expanded(
                  child: Container(
                    //color: Colors.black26,
                    child: StreamBuilder(
                      stream: _bloc.getAzkarListStream,
                      builder: (BuildContext context,AsyncSnapshot snapshot) {
                        //print('done');
                        //print(snapshot.data![1].titleAr);
                        //decode json file
                        ///var jsonData = json.decode(snapshot.data.toString());
                        //try {
                          if (!snapshot.hasData || snapshot.data ==null) {
                           return Center(child: CircularProgressIndicator());
                         }else {
                           //print('done 2');
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              padding: EdgeInsets.symmetric(horizontal: 5.0.w,vertical: 2.0.h),
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index,) {
                                return CardAzkarList(
                                  title: snapshot.data![index].title.trim(),
                                  titlear: snapshot.data![index].titleAr.trim(),
                                  srcImage: snapshot.data![index].srcImage.trim(),
                                  isRaght: true,
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return AzkarDtils(
                                        fileName: snapshot.data![index].filename,
                                        nameItem: locale.countryCode =='EG'?
                                         snapshot.data![index].titleAr:
                                         snapshot.data![index].title,
                                        );
                                    }));
                                  },
                                );
                                //return Container();
                              },
                            );
                          }
                        // } catch (e) {
                        // }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}