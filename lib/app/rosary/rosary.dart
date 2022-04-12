import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';



class Rosary extends StatefulWidget {
  Rosary({Key? key}) : super(key: key);

  @override
  _RosaryState createState() => _RosaryState();
}

class _RosaryState extends State<Rosary> {
  //final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    //getData();
  }


  //
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  int counter = 0;
  double? circval;
  int? circvaltimes;
  String titleRosary ='';

  // ignore: missing_return
  Future<String> getData() async {
    final SharedPreferences prefs = await _sprefs;
    if (prefs.getString('counter') == null) {
      prefs.setString('counter', "0");
    }
    int data = int.parse(prefs.getString('counter')!);
    this.setState(() {
      counter = data;
      circval = counter.toDouble() - (counter ~/ 33) * 33;
      circvaltimes = counter ~/ 33;
    });
    return '';
  }

  // ignore: missing_return
  Future<String> incrementCounter() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      counter++;
      circval = counter.toDouble() - (counter ~/ 33) * 33;
      circvaltimes = counter ~/ 33;
      prefs.setString('counter', counter.toString());
    });
    return '';
  }

  // ignore: missing_return
  Future<String> resetCounter() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      counter = 0;
      circval = counter.toDouble() - (counter ~/ 33) * 33;
      circvaltimes = counter ~/ 33;
      prefs.setString('counter', counter.toString());
    });
    return '';
  }

  // ignore: missing_return
  Future<String> minusCounter() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      counter--;
      circval = counter.toDouble() - (counter ~/ 33) * 33;
      circvaltimes = counter ~/ 33;
      prefs.setString('counter', counter.toString());
    });
    return '';
  }

//

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            gradient:value.themeMode == ThemeMode.dark?
            LinearGradient(
              colors:[
                Colors.white10,
                Colors.white10,
              ],):
             LinearGradient(
              colors:[
                Color(0xff1f285a),
                Color(0xff3f51b5),
              ],)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leading:  IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.navigate_before_rounded),
              ) ,
              //toolbarOpacity: 0.3,
              iconTheme: IconThemeData(color: Color(0xffDBDEF2)),
              centerTitle: true,
              //backwardsCompatibility: false,
              /*title: new Text(
                apperTitleRosary,
                style: fontStyleApperTitle
              ),*/
            ),
            body: InkWell(
              onTap: () {
                incrementCounter();
                HapticFeedback.vibrate();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 2.0.h),
                          child: Text(
                            titleRosary,
                            textAlign: TextAlign.center,
                            style: value.themeMode == ThemeMode.dark? Theme.of(context).textTheme.headline5:
                            Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
                          ),
                        ),
                        Container(
                          height: 15.0.h,
                          width: 80.0.w,
                          child: Card(
                            //margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  '$counter',//$
                                  textAlign: TextAlign.center,
                                  style: value.themeMode == ThemeMode.dark? Theme.of(context).textTheme.overline:
                                      Theme.of(context).textTheme.overline!.copyWith(color: Colors.white)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      height: mediaQuery.height,
                      width: mediaQuery.width,
                      //color: Colors.white24,
                      child: Stack(
                        children: [
                          Positioned(
                            //height: 0.0,
                            left: 45.0.w,
                            child: CircleAvatar(
                              backgroundColor: value.themeMode==ThemeMode.dark? Color(0xffDBDEF2):
                              Color(0xFFf7ce80),
                              radius: 22,
                              child: Container(
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(Icons.refresh),
                                    color: value.themeMode==ThemeMode.dark?Theme.of(context).primaryColor:
                                    Colors.black,
                                    iconSize: 30,
                                    onPressed: () {
                                      resetCounter();
                                    }
                                  ),
                                ),
                              ),
                            )
                          ),
                          Positioned(
                            height:20.0.h,
                            left: 20.0.w,
                            child: CircleAvatar(
                              backgroundColor: value.themeMode==ThemeMode.dark? Color(0xffDBDEF2):
                              Color(0xFFf7ce80),
                              radius: 22,
                              child: Center(
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  color:  value.themeMode==ThemeMode.dark?Theme.of(context).primaryColor:
                                    Colors.black,
                                  iconSize: 30,
                                  onPressed: () {
                                    if (counter == 0) {
                                    } else {
                                      minusCounter();
                                    }
                                  }
                                ),
                              ),
                            )
                          ),
                          Positioned(
                            height:20.0.h,
                            right: 20.0.w,
                            child: CircleAvatar(
                              backgroundColor: value.themeMode==ThemeMode.dark? Color(0xffDBDEF2):
                              Color(0xFFf7ce80),
                              radius: 22,
                              child: Center(
                                child: IconButton(
                                  icon: Icon(Icons.settings),
                                  color: value.themeMode==ThemeMode.dark?Theme.of(context).primaryColor:
                                    Colors.black,
                                  iconSize: 30,
                                  onPressed: () async{
                                     //_navigateScreen(context);
                                    return await diloghelper(context);
                                  /* Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Settings()),
                                    );*/
                                  }
                                ),
                              ),
                            )
                          ),

                          Positioned(
                            left: 25.0.w,
                            top: 15.0.h,
                            child: Container(
                              height: 20.0.h,
                              width: 50.0.w,
                              child: SvgPicture.asset(
                                'assets/svg/finger.svg',
                                color:value.themeMode==ThemeMode.dark? Color(0xffDBDEF2):
                                  Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
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

  
  Future diloghelper(context) async{
    showDialog(context: context,builder: (context) => 
    RosaryDialog(
    listWidget: [
      RecomndedAzkar(
              title: 'rosar.dailog.item1'.tr(),
              repet: '100',
              onTap: (){
                
                setState(() {
                  titleRosary = 'rosar.dailog.item1'.tr();
                Navigator.pop(context);
                });
                //print(titleRosary);
              },
            ),
            Divider(indent: 40,endIndent: 40,),
            RecomndedAzkar(
              title: 'rosar.dailog.item2'.tr(),
              repet: '33',
              onTap: (){
                
                
                setState(() {
                  titleRosary='rosar.dailog.item2'.tr();
                  Navigator.pop(context);
                });
              },
            ),
            Divider(indent: 40,endIndent: 40,),
            RecomndedAzkar(
              title: 'rosar.dailog.item3'.tr(),
              repet: '100',
              onTap: (){
                
                setState(() {
                  titleRosary='rosar.dailog.item3'.tr();
                  Navigator.pop(context);
                });
              },
            ),
            Divider(indent: 40,endIndent: 40,),
            RecomndedAzkar(
              title: 'rosar.dailog.item4'.tr(),
              repet: '33',
              onTap: (){
              
                setState(() {
                  titleRosary='rosar.dailog.item4'.tr();
                  Navigator.pop(context);
                });
              },
            ),
            Divider(indent: 40,endIndent: 40,),
    ],

    ));
  }
}




class RosaryDialog extends StatelessWidget{

  final List<Widget>? listWidget;

  const RosaryDialog({Key? key, this.listWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Dialog(
       
          //backgroundColor: Colors.white60,
          
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            margin: EdgeInsets.only(top: 0),
            // decoration: new BoxDecoration(
            //   //color: Colors.white,
            //   shape: BoxShape.rectangle,
            //   //borderRadius: BorderRadius.circular(Consts.padding),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.black26,
            //       blurRadius: 10.0,
            //       offset: const Offset(0.0, 10.0),
            //     ),
            //   ],
            // ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: listWidget!,
            ),
          ),
        );
      }
    );
  }

}

class RecomndedAzkar extends StatelessWidget {
  const RecomndedAzkar({
    Key? key,
    this.title,
    this.repet,
    this.onTap
  }) : super(key: key);

  final String? title;
  final String? repet;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return InkWell(
          onTap: onTap as void Function()?,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: value.themeMode == ThemeMode.dark? Theme.of(context).textTheme.headline5:
                      Theme.of(context).textTheme.headline5!
                ),
                SizedBox(width: 10,),
                Text(
                  'rosar.dailog.item0'.tr(namedArgs: {"num":'$repet'}),
                  //'تقال ' + repet! + 'مرة',
                  textAlign: TextAlign.center,
                  style: value.themeMode == ThemeMode.dark? Theme.of(context).textTheme.headline5:
                      Theme.of(context).textTheme.headline5
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}