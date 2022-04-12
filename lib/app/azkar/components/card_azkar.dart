import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:flutter_share/flutter_share.dart';



class AzkarCard extends StatelessWidget {
  const AzkarCard({
    Key? key,
    required this.jsonData,
    required this.index,
    this.title
  }) : super(key: key);

  final String? title;
  final jsonData;
  final int index;
  //final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            //widget.mydata.removeAt(index);
          },
          child: Container(
            width: 100.0.w,
            margin: EdgeInsets.symmetric(vertical: 1.0.h),
            alignment: Alignment.center,
            child: Card(
                
                //shadowColor: Colors.transparent,
                child: Container(
                  //height: 550.0,
                   //color: Colors.transparent,
                    width:90.0.w,
                  child: Wrap(
                    children: [

                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0),
                      //   height: 10,
                      //   width: MediaQuery.of(context).size.width,
                      //   color: Color(0xff0b1a2d),
                      // ),
                      
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                jsonData[index]['zekr'],
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: Text(
                                jsonData[index]['bless'],
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text(
                                'azkar.item.item0'.tr(
                                  namedArgs: {'num':'${ jsonData[index]["repeat"].toString()}'}),
                                //'تقال '+ jsonData[index]["repeat"].toString() +' '+ 'مرة ',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Container(
                        //width: 100.0.w,
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          height: 6.0.h,
                          //width: 50.0.w,
                          //margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          //margin: EdgeInsets.only(bottom: 0, top: 0),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.only(
                          //     topRight:  Radius.circular(20),
                          //     topLeft:  Radius.circular(20),
                          //   ),
                          //   color:  ColorUtil.minColor1,
                          // ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //
                              Container(
                               //margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  radius: 2.0.h,
                                  onTap: () {
                                    share(title!,jsonData[index]['zekr']);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:Theme.of(context).primaryColor,
                                    radius: 2.0.h,
                                    child: Icon(
                                      Icons.share,color: Colors.white,
                                      size: 2.0.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     //SizedBox(height: 4.0.h,)
                    ],
                  ),
                )),
          ),
        );
      }
    );
  }

   Future<void> share(String title,String? text) async {
    await FlutterShare.share(
        title: title,
        text: text);
        //linkUrl: 'https://flutter.dev/',
        //chooserTitle: 'Example Chooser Title');
  }

}