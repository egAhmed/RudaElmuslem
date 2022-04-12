import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/grid_Card.dart';



class HomeScreen extends StatefulWidget {
 // final ScreenArgumentshome? screenArguments;

  //const HomeScreen( {Key? key, this.screenArguments}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //final _nativeAdController = NativeAdmobController();
  //static const adUnitID = "ca-app-pub-8468747276972837/4758819778";//ca-app-pub-8468747276972837/4758819778
   //ca-app-pub-3940256099942544/8135179316
   


  

  
  
  @override
  Widget build(BuildContext context) {
    //contextDashList =context;
    return Body();
  }
}

class DashGrid extends StatelessWidget {
  const DashGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("json/main_card.json"),
      builder: (context, snapshot) {
        var jsonData = json.decode(snapshot.data.toString());
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          itemCount: jsonData == null ? 0 : jsonData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context,int index,){
            if(snapshot.connectionState == ConnectionState.done){
                return  GridCard(
                  //titlebutton: jsonData[index]['titlebutton'],
                  imageCard: 'assets/svg/'+jsonData[index]['imageCard'],
                  onTap: (){
                    Navigator.pushNamed(context, '/'+jsonData[index]['onTap']);
                    //print('object');
                  },
                  tag: jsonData[index]['onTap'],
                  titleCard: jsonData[index]['titleCard'],
                  //contantCrad: jsonData[index]['description'],
                );
              }else {
                  return CircularProgressIndicator();
                }
          }
        );
      },
    );
  }
}
class ScreenArgumentshome {
  final double longitude;
  final double latitude;

  ScreenArgumentshome(this.longitude, this.latitude);
  
}