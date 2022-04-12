//import 'package:easy_localization/easy_localization.dart';

import 'package:easy_localization/src/public_ext.dart';
import 'package:provider/provider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rudaelmoslem/app/quran/new/quranN.dart';
import 'package:rudaelmoslem/app/quran/surah/surah_list.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/provider/drawer_provider.dart';


import 'drawer.dart';
import 'drawer_menu.dart';


class BasePage extends StatefulWidget {


  const BasePage(   {Key? key, this.screenArgs,

  }) : super(key: key);

  //final Widget childScreen;
  //final User user;
  final ScreenArguments? screenArgs;

  static List<MenuItem> mainMenu = [
    MenuItem("quran.minu.fhras".tr(), Icons.payment, 0,(){}),
     MenuItem("quran.minu.hafz".tr(), Icons.notifications, 1,(){}),
    MenuItem("quran.minu.goto".tr(), Icons.card_giftcard, 2,(){}),
   
    
  ];

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final _drawerController = ZoomDrawerController();
  

  int _currentPage = 0;


  

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: DrawerApp.isRTL()?TextDirection.rtl:TextDirection.ltr,
      child: DrawerApp(
        menuScreen: DrawerMenuScreen(
          BasePage.mainMenu,
          callback: _updatePage,
          current: _currentPage,
          user:" widget.screenArgs.user",//--------------------------------------
        ),
        mainScreen: MainScreen(Screen:widget.screenArgs!.childScreen,),
        borderRadius: 24.0,
        controller: _drawerController,
        //showShadow: true,
        angle: 0.0,
        slideWidth:
            MediaQuery.of(context).size.width * (DrawerApp.isRTL() ? .45 : 0.65),
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.easeInOut,
      ),
    );
  }

  void _updatePage(index) {
    Provider.of<DrawerMenuProvider>(context, listen: false).updateCurrentPage(index);
    //print(index);
     _drawerController.toggle();
    if(index==0){
      //  Navigator.pushNamed(context,'/quran',arguments: ScreenArguments(SurahList()))
      //   .whenComplete(() => RefreshIndicatorState());
      Navigator.popAndPushNamed(context, '/quran/surahlist');
    }else if(index==1){
      //QuranN p = QuranN();
      QuranN.mykey.currentState!.saveBookmark();
     // saveBookmark();
      
    }else if(index==2){
      QuranN.mykey.currentState!.getBookmark();
    }
   
  }
}

class MainScreen extends StatefulWidget {

  final Widget Screen;

  const MainScreen({Key? key,required this.Screen}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final rtl = DrawerApp.isRTL();
    return ValueListenableBuilder<DrawerState>(
      valueListenable: DrawerApp.of(context)!.stateNotifier!,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: widget.Screen,
        onPanUpdate: (details) {
          if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            //DrawerApp.of(context).toggle();
          }
        },
        onDoubleTap: (){DrawerApp.of(context)!.toggle();},
        onLongPressMoveUpdate: (details){
           //if (details < 6 && !rtl || details.delta.dx < -6 && rtl) {
            //DrawerApp.of(context).toggle();
          //}
        },
      ),
    );
  }
}

class DialogHelper {
  static exit(context) => 
  showDialog(context: context,builder: (context) => SurahList());
}