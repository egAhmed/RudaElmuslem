import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/core/home/home.dart';
import 'package:rudaelmoslem/app/core/onefirst/components/ThemePage.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/settings/NotificationSettingPage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'ZoneChooser.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {

  final _pageDecoration =  PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700 ,color:Color(0xff8E9BE6) ),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.all(8.0),
  );

  bool _isDoneSetLocation = false;
  AnimationController? _animController;
  MyNotificationType _type =MyNotificationType.values.elementAt(GetStorage().read(kNotificationType));
  var themeMode;

  double? latitude;
  double? longitude;
  String? location;
  late Position _currentPosition;
  String? _currentAddress;
  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    
    List<PageViewModel> _pages = [

      PageViewModel(
          title: 'onefirst.page1.title'.tr(),
          body:
              'onefirst.page1.body'.tr(),
          image: Image.asset(
            'assets/icons/Gps-icon.png',
            width: 50.0.w,
          ),
          decoration:  PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 20.0.sp, fontWeight: FontWeight.w700 ,
              color:themeMode == ThemeMode.dark? Theme.of(context).primaryColorLight:
                    Theme.of(context).primaryColorDark, ),
            bodyTextStyle: TextStyle(fontSize: 14.0.sp),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            imagePadding: EdgeInsets.symmetric(vertical: 1.0.h,horizontal: 1.0.w),
            footerPadding: EdgeInsets.symmetric(vertical: 1.0.h) ,bodyFlex:2 ,
          ),
          footer: _isDoneSetLocation
              ?  Text(
                  'onefirst.page1.text1'.tr(),
                  style: themeMode == ThemeMode.dark? Theme.of(context).primaryTextTheme.subtitle2:
                  Theme.of(context).primaryTextTheme.subtitle2,
                  textAlign: TextAlign.center,
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:themeMode == ThemeMode.dark? Theme.of(context).primaryColorLight:
                    Theme.of(context).primaryColor,
                    
                  ),
                  onPressed: () async {
                    var res =
                      await LocationChooser.showLocationChooser(context);
                    if (res) {
                      setState(() {
                        _isDoneSetLocation = true;
                      });
                    }      
                  },
                  child:  Text(
                    'onefirst.page1.text2'.tr(),
                    style:themeMode == ThemeMode.dark? Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white):
                    Theme.of(context).textTheme.headline5!.copyWith(color: Color(0xFFf7ce80)),
                  ),
                )),

      PageViewModel(
        // image: Image.asset(
        //   'assets/bam/Message.png',
        //   width: 200,
        // ),
        image: Builder(
          builder: (context) {
            bool _isDarkMode =
                Theme.of(context).brightness == Brightness.dark;
            if (_isDarkMode) {
              _animController!.forward();
            } else {
              _animController!.reverse();
            }
            return AnimatedMoon(
              animationController: _animController,
              isDarkMode: _isDarkMode,
              width: 60.0.w,//---------------
            );
          },
        ),
        bodyWidget: const ThemesOption(),
        title: 'onefirst.page2.title'.tr(),
        decoration:PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 20.0.sp, fontWeight: FontWeight.w700 ,
              color:themeMode == ThemeMode.dark? Theme.of(context).primaryColorLight:
                    Theme.of(context).primaryColorDark, ),
            bodyTextStyle: TextStyle(fontSize: 14.0.sp),contentMargin: EdgeInsets.symmetric(vertical: 1.0.h),
            descriptionPadding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 5.0.w),bodyFlex:2 ,
           imagePadding: EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 1.0.w),
          ),
      ),

      PageViewModel(
        image: Image.asset('assets/icons/Clock.png', width: 200),
        title: 'onefirst.page3.title'.tr(),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 20.0.sp, fontWeight: FontWeight.w700 ,
              color:themeMode == ThemeMode.dark? Theme.of(context).primaryColorLight:
                    Theme.of(context).primaryColorDark, ),
            bodyTextStyle: TextStyle(fontSize: 14.0.sp),contentMargin: EdgeInsets.symmetric(vertical: 1.0.h),
            descriptionPadding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 5.0.w),bodyFlex:2 ,
           imagePadding: EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 1.0.w),
          ),
        bodyWidget: Column(mainAxisSize: MainAxisSize.min, children: [
          RadioListTile(
              value: MyNotificationType.noazan,
              groupValue: _type,
              title:  Text('onefirst.page3.text1'.tr(),),
              onChanged: (MyNotificationType? type) {
                GetStorage().write(kNotificationType, type?.index);
                setState(() => _type = type!);
              }),
          RadioListTile(
              value: MyNotificationType.azan,
              groupValue: _type,
              title:  Text('onefirst.page3.text2'.tr(),),
              onChanged: (MyNotificationType? type) {
                GetStorage().write(kNotificationType, type?.index);
                setState(() => _type = type!);
              }),
        ]),
      ),

      PageViewModel(
        title: 'onefirst.page4.title'.tr(),
        body:
            'onefirst.page4.text1'.tr(),//Welcome abroad. Do explore other features and tweak other settings as well.
        image: Image.asset(
          'assets/icons/Tick.png',
          width: 200,
        ),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 20.0.sp, fontWeight: FontWeight.w700 ,
              color:themeMode == ThemeMode.dark? Theme.of(context).primaryColorLight:
                    Theme.of(context).primaryColorDark, ),
            bodyTextStyle: TextStyle(fontSize: 14.0.sp),contentMargin: EdgeInsets.symmetric(vertical: 1.0.h),
            descriptionPadding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 5.0.w),bodyFlex:2 ,
           imagePadding: EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 1.0.w),
          ),
      ),
    ];

    //print(themeMode);

    return Consumer<ThemeController>(
      builder: (context, value, child) {
       //print(value.themeMode);
         themeMode = value.themeMode;
        return IntroductionScreen(
            pages: _pages,
            //rawPages: [],
            color: value.themeMode == ThemeMode.dark? Theme.of(context).primaryColorLight:
            Theme.of(context).primaryColorDark,
            dotsDecorator: DotsDecorator(
              activeColor: value.themeMode == ThemeMode.dark? Theme.of(context).primaryColorLight:
            Theme.of(context).primaryColorDark,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
            done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
            curve: Curves.fastLinearToSlowEaseIn,
            onDone: () {
              GetStorage().write(kIsFirstRun, false);
              GetStorage().write(kHaventIntroducedToNotifType, false);
              Navigator.pushReplacementNamed(context, '/home',);//----------
            });
      }
    );
  }


}