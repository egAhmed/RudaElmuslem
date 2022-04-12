import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

import 'components/card_azkar.dart';


class AzkarDtils extends StatefulWidget {

  final String? fileName;
  final String? nameItem;

  const AzkarDtils({Key? key, this.fileName, this.nameItem}) : super(key: key);
  

  @override
  _AzkarDtilsState createState() => _AzkarDtilsState();
}

class _AzkarDtilsState extends State<AzkarDtils> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Scaffold(
          //backgroundColor: ColorUtil.minColor1,
          body: Column(
            children: [
              SizedBox(height: 1.0.h,),
              Container(
                height: 10.0.h,
                width: 100.0.w,
                alignment: Alignment.center,
                child: Text(
                  widget.nameItem!,
                  style: Theme.of(context).textTheme.headline3
                ),
              ),
              SizedBox(height: 1.0.h,),
              Expanded(
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString("assets/json/azkar/${widget.fileName}.json"),
                  builder: (context, snapshot) {
                    var jsonData = json.decode(snapshot.data.toString());
                    //try {
                      if(snapshot.connectionState == ConnectionState.done){
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.builder(
                            itemCount:jsonData == null ? 0 : jsonData.length,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            itemBuilder: (BuildContext context,int index,) {
                              return AzkarCard(jsonData: jsonData,index: index,title: widget.nameItem,);
                            },
                          ),
                        );
                      }else {
                        return Center(child: CircularProgressIndicator());
                      } 
                    //} catch (e) {
                      //print(e);
                    //}
                  }
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}