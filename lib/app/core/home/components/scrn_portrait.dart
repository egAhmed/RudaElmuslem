import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/core/home/components/card_button.dart';
import 'package:rudaelmoslem/app/quran/drawer/base_page.dart';
import 'package:rudaelmoslem/app/quran/quran.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/provider/updater_provider.dart';
import 'package:rudaelmoslem/settings/NotificationSettingPage.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/update_checker.dart';
import 'package:rudaelmoslem/widget/see_mor.dart';

import 'card_time.dart';
import 'grid_v.dart';
import 'lasr_read.dart';

class ScrnPortrait extends StatefulWidget {
  @override
  _ScrnPortraitState createState() => _ScrnPortraitState();
}

class _ScrnPortraitState extends State<ScrnPortrait> {
  AnimationController? animationController;
  late BannerAd _ad;
  bool _isAdLoaded = false;
  // bool showFirstChild = true;
  // late bool _showNotifPrompt;

  @override
  void initState() {
    super.initState();
    
   

   // showNotifPrompt(context);

     MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
        testDeviceIds: [
         // 'DF693493239FEF390746FE861B201FC3',
         // 'EB458550DFD9A5B6EF3D8FD1A0705EFA',
          'DD32ABC774BD4859A992F572A5F2159A'
        ]));

    _ad = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-8468747276972837/6050546680',
        listener: BannerAdListener(
          onAdLoaded: (_) {
            setState(() {
              _isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
            throw error;
          },
        ),
        request: const AdRequest());
    _ad.load();

    //checkForUpdate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //showNotifPrompt(context);
  }

  // update v
  void checkForUpdate() async {
    var res = await AppUpdateChecker.updatesAvailable();
    if (!res) return;

    Provider.of<UpdaterProvider>(context, listen: false).needForUpdate = res;
  }

  /// fetch offset value of hijri date
  Future<RemoteConfig> fetchRemoteConfig() async {
    final RemoteConfig remoteConfig = RemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 15),
      minimumFetchInterval: const Duration(hours: 8),
    ));
    // RemoteConfigValue(null, ValueSource.valueStatic);
    await remoteConfig.fetchAndActivate();
    return remoteConfig;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          //decoration: boxDecorationGradient,
          //color: ColorUtil.buckgrundColor,
          child: Scaffold(
            //backgroundColor: Color(0xff1F2859),
            body: SafeArea(
              child: Container(
                //height: 70.0.h,
                //color: colorImage,
                //width: 100.0.w,
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(height: 5.0.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                        child: Text(
                          'homepage.title'.tr(),
                          style: Theme.of(context).textTheme.headline1
                        ),
                      ),
                      SizedBox(height: 1.0.h,),
                      
                      Container(
                        width: 100.0.w,
                        alignment: Alignment.center,
                        child: Card(
                          color: value.themeMode == ThemeMode.dark?Theme.of(context).cardTheme.color:
                          Color(0xFF3F51B5),
                          child: Container(
                            height: 30.0.h,
                            width: 90.0.w,
                            
                            child: CaedTime(),
                          ),
                        ),
                      ),


                      Container(
                        height: 35.0.h,
                        //color: Colors.black12,
                        child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          //itemExtent: 10,
                          physics: BouncingScrollPhysics(),
                          children: [
                            SizedBox(width: 2.0.w,),
                            GridH(
                              child1: CardButton(
                                titleCard: 'homepage.appname.moshaf'.tr(),
                                imageCard: 'assets/svg/quran.svg',
                                //buttonHight: 30.0.h,
                                tag: 'quran',
                                onTap: (){
                                  Navigator.pushNamed(context,'/quran',arguments: ScreenArguments(QuranHome()))
                                  .whenComplete(() => RefreshIndicatorState());
                                },
                              ),
                              child2: CardButton(
                                titleCard: 'homepage.appname.zkar'.tr(),
                                imageCard: 'assets/svg/allah.svg',
                                tag: 'azkar',
                                onTap: (){
                                  Navigator.pushNamed(context,'/azkar');
                                },
                              ),
                            ),
                            SizedBox(width: 3.0.w,),
                            GridH(
                              child1: CardButton(
                                titleCard: 'homepage.appname.sbha'.tr(),
                                imageCard: 'assets/svg/islam.svg',
                                tag: 'rosary',
                                onTap: (){
                                  
                                  Navigator.pushNamed(context,'/rosary').whenComplete(() => (){});
                                },
                              ),
                              child2: CardButton(
                                titleCard: 'homepage.appname.saly'.tr(),
                                imageCard: 'assets/svg/islamMohamed.svg',
                                //buttonHight: 30.0.h,
                                tag: 'saly',
                                onTap: (){
                                  Navigator.pushNamed(context,'/saley');
                                },
                              ),
                            ),
                            SizedBox(width: 3.0.w,),
                            GridH(
                              child1: CardButton(
                                titleCard: 'homepage.appname.slahtime'.tr(),
                                imageCard: 'assets/svg/clock.svg',
                                tag: 'prayer',
                                onTap: (){
                                  Navigator.pushNamed(context,'/prayer');
                                },
                              ),
                              child2: CardButton(
                                titleCard: 'homepage.appname.busla'.tr(),
                                imageCard: 'assets/svg/kaaba.svg',
                                tag: 'qiplah',
                                onTap: (){
                                  Navigator.pushNamed(context,'/qibla');
                                },
                              ),
                            ),
                            SizedBox(width: 3.0.w,),
                        
                            GridH( 
                              child1: CardButton(
                                titleCard: 'homepage.appname.info'.tr(),
                                imageCard: 'assets/svg/information.svg',
                                tag: 'info3',
                                onTap: (){
                                  Navigator.pushNamed(context,'/info');
                                },
                              ),
                              child2: CardButton(
                                titleCard: 'homepage.appname.setting'.tr(),
                                imageCard: 'assets/svg/settings.svg',
                                tag: 'setting',
                                onTap: (){
                                  Navigator.pushNamed(context,'/appsetting');
                                },
                              ),
                            ),
                            SizedBox(width: 3.0.w,),
                            

                          ],
                        ),
                      ),

                      LastRead(),
                      
                      SizedBox(height: 2.0.h,),
                      // ViewrArea(
                      //   hieght: 30.0.h,
                      //   titleArea: 'Featured',
                      // ),

                      //showNotifPrompt(context),
                      Container(
                        child: Builder(builder: (_) {
                          if (_isAdLoaded) {
                            return Container(
                                child: AdWidget(ad: _ad),
                                width: _ad.size.width.toDouble(),
                                height: _ad.size.height.toDouble() + 30,
                                alignment: Alignment.center);
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                      ),
                      
                       
                        
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }


  

  
}