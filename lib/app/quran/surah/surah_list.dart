import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/app/quran/new/quranN.dart';
import 'package:rudaelmoslem/bloc/sura_list_bloc.dart';
import 'package:rudaelmoslem/constants/constants.dart';
import 'package:rudaelmoslem/models/surah/sura_list_model.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:rudaelmoslem/widget/search_filed.dart';

import 'components/suraitem_list.dart';


class SurahList extends StatefulWidget {
//static final GlobalKey<_SurahListState> mykey = GlobalKey<_SurahListState>(); 
  
  SurahList({Key? key}) : super(key: key);

  @override
  _SurahListState createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  late SuraListBloc _bloc;
  //static late  String surahName;
  String querySearch = '';
  var results = [];
  List<SuraList> row =[];
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    _bloc =SuraListBloc();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Locale  locale = Localizations.localeOf(context);
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          //color: ColorUtil.buckgrundColor,
          child: Scaffold(
            //backgroundColor: Colors.white70,
             appBar: AppBar(
               title: Text(
                 "quran.minu.fhras".tr(),
                 style: Theme.of(context).textTheme.headline4
                ),
                centerTitle: true,
               backgroundColor: Colors.transparent,
               elevation: 0,
             ),
             body: Container(
               
               child: Column(
                 children: [

                   SizedBox(height: 2.0.h,),
                   searchField(hintText: 'Search',),
                   SizedBox(height: 2.0.h,),
                   Expanded(
                     child: StreamBuilder(
                       stream: _bloc.getSuraListStream,
                       //initialData: initialData,
                       builder: (BuildContext context, AsyncSnapshot snapshot) {
                         if (!snapshot.hasData || snapshot.data.isEmpty) {
                           return Center(child: CircularProgressIndicator());
                         }else{

                              row =  snapshot.data;
                              results = row.where((element) =>
                               element.titleAr
                              .toString()
                              .toLowerCase()
                              .contains(querySearch.toLowerCase())||
                              element.title
                              .toString()
                              //.toLowerCase()
                              .contains(querySearch)).toList() ;
                              //print(results.length);
                              //print(results[0].titleAr.trim());

                           return querySearch.isEmpty?
                            ListView.separated(
                             itemCount: snapshot.data.length,
                              physics: BouncingScrollPhysics(),
                             padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                             separatorBuilder: (context,index){ return Divider();},
                             itemBuilder: (BuildContext context, int index) {
                             return SuraItemList(
                               title: snapshot.data[index].title.trim(),
                               titleAr: snapshot.data[index].titleAr.trim(),
                               supTitle: snapshot.data[index].type.trim() + ' - '+
                               snapshot.data[index].count.toString() + ' Verses',
                               numSura: '${index+1}',
                               onTap: (){
                                 locale.countryCode == 'EG'?
                                  KSurahName = snapshot.data[index].titleAr.trim():
                                  KSurahName = snapshot.data[index].title.trim();
                                  int num =  snapshot.data[index].pages;
                                  GetStorage().write(kBookmarkSurahName,KSurahName);
                                  GetStorage().write(kBookmarkSurahNum,num);
                                  Navigator.pushReplacementNamed(context,'/quran',arguments: ScreenArguments(QuranN(suraNum: num,)))
                                   .whenComplete(() => RefreshIndicatorState()); 
                                },
                             );
                            },
                           ):
                           ListView.separated(
                             itemCount: results.length,
                              physics: BouncingScrollPhysics(),
                             padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                             separatorBuilder: (context,index){ return Divider();},
                             itemBuilder: (BuildContext context, int index) {
                             return SuraItemList(
                               title: results[index].title.toString(),
                               titleAr: results[index].titleAr.toString(),
                               supTitle: results[index].type.toString() + ' - '+
                               results[index].count.toString() + ' Verses',
                               numSura: '${index+1}',
                               onTap: (){
                                  locale.countryCode == 'EG'?
                                  KSurahName = snapshot.data[index].titleAr.trim():
                                  KSurahName = snapshot.data[index].title.trim();
                                  int num =  results[index].pages;
                                  GetStorage().write(kBookmarkSurahName,KSurahName);
                                  GetStorage().write(kBookmarkSurahNum,num);
                                  Navigator.pushReplacementNamed(context,'/quran',arguments: ScreenArguments(QuranN(suraNum: num,)))
                                   .whenComplete(() => RefreshIndicatorState()); 
                                },
                             );
                            },
                           );
                         }
                       },
                     ),
                   ),
                 ],
               ),
             ),
          ),
        );
      }
    );
  }

  searchField({String? hintText}){
    return  Container(
        width: 90.0.w,
        height: 8.0.h,
        //margin: EdgeInsets.only(bottom: 2.0.h),
        decoration: BoxDecoration(
          color: Colors.white12,//---------------
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Center(
          child: Container(
            width: 70.0.w,
            child: TextField(
              //textDirection: TextDirection.rtl ,
              controller: textController,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                icon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: hintText! 
              ),
              autofocus: false,
              focusNode: FocusNode(canRequestFocus: false),
              onChanged: (v){
                setState(() {
                  querySearch = v;
                });                
              },
              onEditingComplete: (){
                //FocusScope.of(context).requestFocus(FocusNode());
                //FocusScope.of(context).unfocus();
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
            ),
          ),
        ),
      );
  }
}