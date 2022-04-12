import 'package:flutter/material.dart';
import 'package:rudaelmoslem/app/lslamic/components/card_libaray.dart';
import 'package:rudaelmoslem/bloc/islamic_bloc.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'cardpdf.dart';


class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  late IslamicAPI _bloc;
  var _currentIndex= 0;

  @override
  void initState() {
    _bloc = IslamicAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: ColorUtil.minColor1,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 3.0.h,),
          Container(
            child: Text(
              'المكتبة الاسلامية',
              style: TextStyle(
                fontSize: 14.0.sp,
                color: Colors.white,
                fontFamily: 'Cairo'
              ),
            ),
          ),
          SizedBox(height: 10.0.h,),
          Expanded(
            child: StreamBuilder(
              stream: _bloc.getIslamicListStream,
              //initialData: initialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData || snapshot.data ==null) {
                  return Center(child: CircularProgressIndicator());
                }else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    padding: EdgeInsets.symmetric(vertical: 3.0.h,horizontal: 8.0.w),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return CardLibarary(
                        nameBook: snapshot.data![index].titleAr.trim(),
                        pathfile: snapshot.data![index].fileName.trim(),
                      );     
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: ColorUtil.TextColorGury,
        margin: EdgeInsets.symmetric(horizontal: 5.0.w,vertical: 2.5.h),
        itemPadding: EdgeInsets.symmetric(horizontal: 5.0.w,vertical: 1.0.h),
        onTap: (i){
          setState(() {
            _currentIndex = i;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('home')
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Likes')
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Likes')
          ),
        ],
      ),
    );
  }
}