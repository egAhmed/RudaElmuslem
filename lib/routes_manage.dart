import 'package:flutter/material.dart';
import 'package:rudaelmoslem/app/azkar/azkar.dart';
import 'package:rudaelmoslem/app/azkar/azkar_dtils.dart';
import 'package:rudaelmoslem/app/core/home/home.dart';
import 'package:rudaelmoslem/app/core/onefirst/oneFirst.dart';
import 'package:rudaelmoslem/app/core/splash/splash_screen.dart';
import 'package:rudaelmoslem/app/info/infoapp.dart';
import 'package:rudaelmoslem/app/know/know.dart';
import 'package:rudaelmoslem/app/lslamic/islamic.dart';
import 'package:rudaelmoslem/app/lslamic/pdf_view.dart';
import 'package:rudaelmoslem/app/lslamic/section_view.dart';
import 'package:rudaelmoslem/app/prayer/prayer_tim.dart';
import 'package:rudaelmoslem/app/qibla/qiblah.dart';
import 'package:rudaelmoslem/app/quran/drawer/base_page.dart';
import 'package:rudaelmoslem/app/quran/new/quranN.dart';
import 'package:rudaelmoslem/app/quran/surah/surah_list.dart';
import 'package:rudaelmoslem/app/rosary/rosary.dart';
import 'package:rudaelmoslem/app/saley/saley.dart';
import 'package:rudaelmoslem/app/settingapp/appsetting.dart';
//import 'package:rudaelmoslem/models/surah/sura_list_model.dart';
import 'package:rudaelmoslem/settings/NotificationSettingPage.dart';
import 'package:rudaelmoslem/settings/SettingsPage.dart';
import 'package:rudaelmoslem/settings/ThemePage.dart';

import 'app/prayer/setting/pray_setting.dart';
import 'constants/constants.dart';


class RoutesManage {

  static const init = '/';
  static const home = '/home';
  static const quran = '/quran';
  static const azkar = '/azkar';
  static const appSetting = '/appsetting';
  static const islamick = '/islamic';
  static const islamickPdf = '/islamic/pdfview';
  static const islamickSection = '/islamic/section';
  static const info = '/info';
  static const know = '/know';
  static const rosary = '/rosary';
  static const prayer = '/prayer';
  static const qibla = '/qibla';
  static const oneFirst = '/onefirst';
  static const praysetting = '/prayer/setting';
  static const praynotification = '/prayer/setting/notification';
  static const prayersetting = '/prayer/setting/prayer';
  static const themesPage = '/setting/theme';
  static const azkarDil = '/azkar/detils';
  static const saley = '/saley';
  static const surah = '/quran/surah';
  static const quranN = '/quran/qurann';
  static const surahlist = '/quran/surahlist';
  //final AnimationController animationController;

  
  static Route<dynamic>? routes(RouteSettings s) {
    switch (s.name) {
      case RoutesManage.init:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesManage.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutesManage.azkar:
        return MaterialPageRoute(builder: (_) => Azkar());
      case RoutesManage.appSetting:
        return MaterialPageRoute(builder: (_) => AppSetting());
      case RoutesManage.islamick:
        return MaterialPageRoute(builder: (_) => IslamicLbrary());
      case RoutesManage.info:
        return MaterialPageRoute(builder: (_) => InfoApp());
      case RoutesManage.know:
        return MaterialPageRoute(builder: (_) => KnowIslamic());
      case RoutesManage.rosary:
        return MaterialPageRoute(builder: (_) => Rosary());
      case RoutesManage.saley:
        return MaterialPageRoute(builder: (_) => SaleyScreen());
      case RoutesManage.prayer:
        return MaterialPageRoute(builder: (_) => PrayerTimeAdhan());
      case RoutesManage.oneFirst:
        return MaterialPageRoute(builder: (_) => OneFirstScreen());
      case RoutesManage.qibla:
        //assert(s.arguments !=null);
        return MaterialPageRoute(builder: (_) => QiplahPlayer());
      case RoutesManage.quran:
          assert(s.arguments !=null);
        return MaterialPageRoute(builder: (_) => BasePage(screenArgs: s.arguments as ScreenArguments?,));
      case RoutesManage.surahlist:
        return MaterialPageRoute(builder: (_) => SurahList());
      // case RoutesManage.surah:
      //   assert(s.arguments != null );
      //   return MaterialPageRoute(builder: (_) => SurahQuran(suraNum:s.arguments,));
       case RoutesManage.quranN:
        assert(s.arguments != null );
        return MaterialPageRoute(builder: (_) => QuranN(suraNum:s.arguments,));
      case RoutesManage.islamickPdf:
        assert(s.arguments != null );
        return MaterialPageRoute(builder: (_) => PdfView(pathAsset: s.arguments as String,));
      case RoutesManage.islamickSection:
        return MaterialPageRoute(builder: (_) => SectionView());
      case RoutesManage.praynotification:
        return MaterialPageRoute(builder: (_) => NotificationPageSetting());
      case RoutesManage.praysetting:
        return MaterialPageRoute(builder: (_) => PraySettings());
      case RoutesManage.prayersetting:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case RoutesManage.themesPage:
        return MaterialPageRoute(builder: (_) => ThemesPage());
      case RoutesManage.azkarDil:
        assert(s.arguments != null );
        return MaterialPageRoute(builder: (_) => AzkarDtils(fileName: s.arguments as String?,nameItem: s.arguments as String?,));
      default:
        return null;
    }
  }
}