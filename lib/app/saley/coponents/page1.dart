import 'dart:math';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/models/saly/radio_model.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'card_saly_time.dart';

class Page1 extends StatefulWidget {
  //final ScrollController? scrollController;
  //final List? pages;
  Page1({Key? key,
   //this.scrollController,
    // this.pages, 
     }) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var cheacked =false;
  List<RadioModel> listRadio = [];

  Future<void> animateScroll(double page) async {
    //setState(() => _isScrolling = true);
    // await widget.scrollController.animateTo(
    //    max(min(page, _pages.length - 1), 0),
    //    duration: Duration(milliseconds: 350),
    //    curve: Curves.easeIn,
    //   );
    // await _pageController.animateToPage(
    //   max(min(page, _pages.length - 1), 0),
    //   duration: Duration(milliseconds: 350),
    //   curve: Curves.easeIn,
    // );
    // if (mounted) {
    //   setState(() => _isScrolling = false);
    // }
  }

  var item = GetStorage().read(kSalyMinetRemnditem);

  @override
  void initState() {
    super.initState();

    listRadio.add(new RadioModel(false, '5', 'salyapp.page1.timeType.0'.tr(),));
    listRadio.add(new RadioModel(false, '10', 'salyapp.page1.timeType.0'.tr(),));
    listRadio.add(new RadioModel(false, '15', 'salyapp.page1.timeType.1'.tr(),));
    listRadio.add(new RadioModel(false, '20', 'salyapp.page1.timeType.1'.tr(),));
    listRadio.add(new RadioModel(false, '30', 'salyapp.page1.timeType.1'.tr(),));
    listRadio.add(new RadioModel(false, '40', 'salyapp.page1.timeType.1'.tr(),));
    listRadio.add(new RadioModel(false, '50', 'salyapp.page1.timeType.1'.tr(),));
    listRadio.add(new RadioModel(false, '1', 'salyapp.page1.timeType.2'.tr(),));
    listRadio.add(new RadioModel(false, '2', 'salyapp.page1.timeType.2'.tr(),));
    listRadio.add(new RadioModel(false, '4', 'salyapp.page1.timeType.3'.tr(),));
    listRadio.add(new RadioModel(false, '6', 'salyapp.page1.timeType.3'.tr(),));
    listRadio.add(new RadioModel(false, '12', 'salyapp.page1.timeType.2'.tr(),));

    item != null?listRadio[item].isSelected = true:listRadio[0].isSelected = true;

    
  }


  @override
  Widget build(BuildContext context) {
   return Consumer<ThemeController>(
    builder: (context, value, child){
       return Container(
         child: Column(
           //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 10.0.h,),
             Container(
               child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,  
                children: [
                  Icon((CupertinoIcons.time),
                  size: 80.0.sp,
                  color: Theme.of(context).primaryColor,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                     'salyapp.page1.title'.tr(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    width: 90.0.w,
                    child: Text(
                       'salyapp.page1.detil'.tr(),
                       softWrap: true,
                       textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                  ),
                ],
              ),
             ),
             Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 3.0.h),
                //height: ResponsiveFlutter.of(context).hp(100),
                //width: ResponsiveFlutter.of(context).wp(100),
                child: GridView.builder(
                  primary: false,
                  padding: EdgeInsets.symmetric(vertical: 2.0.h,horizontal: 5.0.w),
                  itemCount: listRadio.length,
                  //scrollDirection: Axis.vertical,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing:2.0.w,
                    mainAxisSpacing: 1.0.h,
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context,index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          listRadio.forEach((element) => element.isSelected = false);
                          listRadio[index].isSelected = true;
                          GetStorage().write(kSalyMinetRemnditem, index);
                          var time = int.parse(listRadio[index].time);
                          GetStorage().write(kSalyMinetRemnd, time);
                          switch (listRadio[index].type) {
                            case 'دقائق':
                               GetStorage().write(kSalyMinetRemndtimeType, 'm');
                              break;
                            case 'دقيقة':
                              GetStorage().write(kSalyMinetRemndtimeType, 'm');
                              break;
                            case 'ساعة':
                              GetStorage().write(kSalyMinetRemndtimeType, 'h');
                              break;
                            case 'ساعات':
                              GetStorage().write(kSalyMinetRemndtimeType, 'h');
                              break;
                            default:
                            GetStorage().write(kSalyMinetRemndtimeType, 'm');
                          }
                          //saveBookmark(listRadio[index].isSelected,index,listRadio[index].type,int.parse(listRadio[index].time));
                          //SalyWidget4 widget4 = SalyWidget4();
                          
                        });
                      },
                      child: CardSalyTimer(item: listRadio[index],),
                    );
                  },
                ),
              ),
            ),
            //Spacer(),
           ],
         ),
       );
     }
   );
  }
}

