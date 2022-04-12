import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rudaelmoslem/widget/main_card.dart';

import 'components/body.dart';


class StartScreen extends StatefulWidget {
  StartScreen({Key? key, this.title}) : super(key: key);
  
  final String? title;
  @override
  _StartScreenState createState() => _StartScreenState();
}

//DeviceIformation deviceIformations;
class _StartScreenState extends State<StartScreen>{

  //AnimationController _controller
  @override
  Widget build(BuildContext context) {
    return Body(); 
  }
}




 /* Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.black38,
                          child: FutureBuilder(
                            future: DefaultAssetBundle.of(context).loadString("json/main_card.json"),
                            builder: (context,snapshot){
                              var jsonData = json.decode(snapshot.data.toString());
                              return ListView.builder(
                                itemCount: jsonData == null ? 0 : jsonData.length,
                                
                                //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context,int index,){

                                  if(snapshot.connectionState == ConnectionState.done){
                                    return  MainCard2(
                                      titlebutton: jsonData[index]['titlebutton'],
                                      imageCard: 'assets/'+jsonData[index]['imageCard'],
                                      onTap: (){
                                        Navigator.pushNamed(context, '/'+jsonData[index]['onTap']);
                                        //print('object');
                                      },
                                      titleCard: jsonData[index]['titleCard'],
                                      contantCrad: jsonData[index]['description'],
                                    );
                                  }else {
                                      return CircularProgressIndicator();
                                    }
                                  

                                },
                              );
                            },
                          ),
                        )*/

/*child: InkWell(
                               onTap: (){
                                 Navigator.pushNamed(context, '/list');
                               },
                               child: Container(
                                 height: 40,
                                 width: 50,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10.0),
                                   color: Color(0xff0b1a2d),
                                 ),
                                 margin: EdgeInsets.symmetric(vertical: 30,horizontal: 50),
                                 child: Center(
                                   child: Text(
                                     'ابدء',
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                        fontSize: contantApp_fontSize,
                                        fontWeight:  contantApp_FontWeight,
                                        color: Colors.white
                                      ),
                                    ),
                                 ),
                               ),
                             ),*/

class MainBackCliper extends CustomClipper<Path> {
  //double move = 0;
  //double slice = math.pi;
  //MainBackCliper(this.move);
  @override
  Path getClip(Size size) {
      var roundnessFactor = 50.0;
      var path = Path();
      //path.moveTo(0, size.height -50);
      path.lineTo(0, size.height );//-50
      path.quadraticBezierTo(0, size.height-80, 100, size.height-100);
      //path.lineTo( 0, size.height);
      path.quadraticBezierTo(size.width*1, size.height-140, size.width, size.height); //circal
      //path.lineTo(size.width , size.height);
      path.lineTo(size.width, 0);//h roundnessFactor * 2
      /*path.quadraticBezierTo(size.width - 10, roundnessFactor,
       size.width - roundnessFactor * 1.5,  roundnessFactor * 1.5);*/ //circal
      //path.lineTo(roundnessFactor * 0.6, size.height *0.33 - roundnessFactor * 0.3);
      /*path.quadraticBezierTo(0, size.height * 0.33,
       0,  size.height * 0.33 + roundnessFactor );*/

       //--------------------------------------------------------
       //Animated
      /* path.lineTo(0,size.height * 0.8);
       double xCenter =
        size.width * 0.5 +(size.width *0.6 +1) * math.sin(move * slice);
        double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
        path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
        path.lineTo(size.width, 0);*/

      /*path.lineTo(0,size.height -70);
      //                     /4 -----------  /2    --------- /2 ----------- -100
      path.quadraticBezierTo(size.width/4, size.height-80, size.width/2,size.height -50);//-- 50
      //                                                   -50    ------        -------- -100
      path.quadraticBezierTo(size.width - (size.width/4), size.height-80, size.width,size.height-70);
      path.lineTo(size.width,size.height);
      path.lineTo(size.width, 0);*/
      
      path.close();
      return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  
}

class GridDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      //margin: EdgeInsets.only(top: 0.0),
      child: ListView(
        //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          MainCard2(
            titlebutton: 'المصحف',
            imageCard: 'assets/moshaf.jpg',
            onTap: (){
              Navigator.pushNamed(context, '/quran');
              //print('object');
            },
          ),

          MainCard2(
            titlebutton: 'المصحف',
            imageCard: 'assets/azkar.png',
            onTap: (){
              Navigator.pushNamed(context, '/azkar');
              //print('object');
            },
            
          ),
          MainCard2(
            titlebutton: 'المصحف',
            imageCard: 'assets/rosary2.png',
            onTap: (){
              Navigator.pushNamed(context, '/rosary');
              //print('object');
            },
          ),
          
          MainCard2(
            titlebutton: 'المصحف',
            imageCard: 'assets/rosary2.png',
            onTap: (){
              Navigator.pushNamed(context, '/rosary');
              //print('object');
            },),
         
        ],
      ),
    );
  }
}

/*
     Positioned(
                    top: 0.0,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, snapshot) {
                        return ClipPath(
                          clipper: MainBackCliper(_controller.value),
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.35,
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                              /*borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(100.0),
                              ),*/
                              color: Color(0xffbaaeec),
                            ),
                          ),
                        );
                      }
                    ),
                  ),

 */