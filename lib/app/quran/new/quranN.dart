import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/quran/surah/surah_list.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';


class QuranN extends StatefulWidget {
  static final GlobalKey<_QuranNState> mykey = GlobalKey<_QuranNState>(); 
  final suraNum;
   QuranN(
   {this.suraNum = 0 }
   ) : super(key: QuranN.mykey);

  @override
  _QuranNState createState() => _QuranNState();
}

class _QuranNState extends State<QuranN> with TickerProviderStateMixin{
  final int pageNum = 0;
  PageController pageController =PageController(initialPage: 0,viewportFraction: 1,keepPage: true);
  //bool visbilityTag = false;
  //bool visibleHorzScroll = false;
  late ScrollController scrollController;
  bool scrollVisible = true;
  late Animation<double> _animation;
  late AnimationController _animationController;
  //SharedPreferences prefs;
  int bookmark =0;

  @override
  void initState() {
    super.initState();
    //getBookmark();
    //IndexChild();
    pageController =  PageController(initialPage: widget.suraNum-1,viewportFraction: 1,keepPage: true);
    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection == ScrollDirection.forward);
      });
      _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    // goToPage(widget.suraNum);
  }

   void setDialVisible(bool value) {
    setState(() {
      scrollVisible = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Consumer<ThemeController>(
            builder: (context, value, child){
            return Scaffold(
              backgroundColor: value.themeMode == ThemeMode.dark ? Colors.white:
              Theme.of(context).scaffoldBackgroundColor,
              body: Container(
                child: PageView.builder(
                  controller: pageController,
                  reverse: true,
                  itemCount: 604,
                  onPageChanged: (val){},
                  itemBuilder: (context,index){
                    int page=index+1;
                    //bookmark = index+.0;
                    return quranPages(
                      "assets/quran/p$page.png",
                    );
                  },
                ),
              ),
            );
          }
        ),
    );
  }

  //kBookmarkSurah
   void saveBookmark() async {
     setState(() {
      _animationController.reverse();
      var d = pageController.position;
      //print(d);
      bookmark = pageController.page!.toInt();
      //print(bookmark );
      //print(KSurahName );
      GetStorage().write(kBookmarkSurah, bookmark);
      GetStorage().write(kBookmarkSurahName, KSurahName);
      //saveBookmark(bookmark);
      //visibleHorzScroll =true;
    });
  }

  getBookmark() async {
    setState(() {
      _animationController.reverse();
      bookmark = GetStorage().read(kBookmarkSurah);
      
      //getBookmark();
      pageController.animateToPage(
      bookmark,
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate);
      //visibleHorzScroll =true;
    });
  }

  goToPage(int? page){
    //_animationController.reverse();
    pageController.jumpToPage(
      page!,
      //duration: Duration(milliseconds: 300),
     // curve: Curves.decelerate
      );
  }


  Widget quranPages(image){
    //print(bookmark);
    //print(pageController.page);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0.w,vertical: 1.0.h),
      child: FittedBox(
        child: Image.asset(image),
        fit: BoxFit.fill,
      ),
    );
  }
}