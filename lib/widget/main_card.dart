import 'package:flutter/material.dart';
import 'package:rudaelmoslem/theme/app_pading.dart';
import 'package:rudaelmoslem/theme/app_size.dart';

class MainCard2 extends StatelessWidget {

  const MainCard2({
    Key? key,
    required this.titlebutton,
    required this.imageCard,
    //this.imageWidth,
    //this.buttonHight,
    //this.textButton,
    required this.onTap,
    this.titleCard,
    this.contantCrad,
    //@required
    //this.deviceIformation,
    //this.imgCardHigth,
    
  }) : super(key: key);
  
  //final DeviceIformation deviceIformation;
  final String titlebutton;
  final String? titleCard;
  final String? contantCrad;
  final String imageCard;
  //final double imageWidth;
  //final double buttonHight;
  //final String textButton;
  final Function onTap;
  //final double imgCardHigth;

  @override
  Widget build(BuildContext context) {
    contextCard = context;
    //var mediaQuery= MediaQuery.of(context);
   
    
        
        return Container(
          height: hightCardBody,
          width: widthCardBody,
            child: SafeArea(
              //minimum: safeAreaMinimum,
              child: Container(
                height: hightCard,
                width: widthCard,
                padding: mainCardPadding,
                //margin: EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  //color: Color(0xff865abc),//0xff865abc,0xff3d4dae,0xffa583cd
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                  child: Stack(
                    children: [
                      Image.asset(
                          imageCard,
                          width: widthCard,
                          height: hightCard,
                          fit: BoxFit.fill,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [
                              0.0,
                              1.0,
                            ],
                            colors: [
                              Colors.black12,//45c2da
                              Colors.black,//0f233d
                            ],
                          )
                        ),
                      ),

                      Positioned(
                        top: 20.0,
                        right: 20.0,
                        child: Container(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  titleCard!,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25.0,
                                    color: Color(0xffD1CABA),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  contantCrad!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.0,
                                    color: Color(0xffD1CABA),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      
                      Positioned(
                        bottom: 30.0,
                        right: 0.0,
                        //left: MediaQuery.of(context).size.width/3.5,
                        child: Container(
                          height: 60.0,
                          width: MediaQuery.of(context).size.width/3.5,
                          child: RaisedButton(
                            color: Color(0xffBAAF95),//0xfff7ac8d/CCAC95
                            onPressed: onTap as void Function()?,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                              ),
                            ),
                            child: Text(
                              'ابدا',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                                color: Colors.black87
                              ),
                              ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
          ),
        );
        
      
  }

}

