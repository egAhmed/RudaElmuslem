import 'package:flutter/material.dart';
import 'package:rudaelmoslem/app/quran/new/quranN.dart';
import 'package:rudaelmoslem/app/quran/surah/surah_list.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int pageNum = 0;
  PageController pageController =PageController(initialPage: 0,viewportFraction: 1,keepPage: true);


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        //color: Color(0xffcff2fb),
        child: Scaffold(
           //backgroundColor: Colors.white,
           body: QuranN(suraNum: 0,)
        ),
      ),
    );
  }
}