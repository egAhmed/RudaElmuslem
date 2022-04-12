import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudaelmoslem/custom_painter/card_painter.dart';
import 'package:rudaelmoslem/theme/app_color.dart';
import 'package:rudaelmoslem/theme/app_size.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';



class GridCard extends StatelessWidget {

  const GridCard({
    Key? key,
    //@required this.titlebutton,
    required this.imageCard,
    //this.imageWidth,
    this.buttonHight,
    this.buttonWidth,
    //this.textButton,
    required this.onTap,
    this.titleCard,
    this.contantCrad,
    this.tag
    //@required
    //this.deviceIformation,
    //this.imgCardHigth,
    
  }) : super(key: key);
  
  //final DeviceIformation deviceIformation;
  //final String titlebutton;
  final String? titleCard;
  final String? contantCrad;
  final String imageCard;
  final String? tag;
  //final double imageWidth;
  final double? buttonHight;
  final double? buttonWidth;
  //final String textButton;
  final Function onTap;
  //final double imgCardHigth;

  @override
  Widget build(BuildContext context) {
    contextCard = context;
    //var mediaQuery= MediaQuery.of(context);
   
    
        
        return Flexible(
          child: GestureDetector(
             onTap: onTap as void Function()?,
            child: Container(
              height: buttonHight == null ?25.0.h:buttonHight,
              width: buttonWidth == null ? 45.0.w:buttonWidth,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Color(0xff865abc),//0xff865abc,0xff3d4dae,0xffa583cd
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: CardClipper(),
                        child: Container(
                          color: Colors.white12,
                        ),
                      ),

                      Positioned(
                        right: 5.0.w,
                        top: 1.0.h,
                        child: Container(
                          width: 15.0.w,
                          height: 10.0.h,
                          child: SvgPicture.asset(
                              imageCard,
                              //fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2.0.h,
                        right: 5.0.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              //height: hightCard,
                              //width: widthCard,
                              //color: Colors.white24,
                              child: Center(
                                child: Container(
                                  child: Hero(
                                    tag: tag!,
                                    child: Text(
                                      titleCard!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10.0.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            
                           /* Positioned(
                              bottom: 00.0,
                              //right: 0.0,
                              //left: MediaQuery.of(context).size.width/3.5,
                              child: Container(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width/2,
                                child: RaisedButton(
                                  color: Color(0xff0b1a2d),//Color(0xffBAAF95),//0xfff7ac8d/CCAC95
                                  onPressed: onTap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      //topLeft: Radius.circular(20),
                                      //bottomLeft: Radius.circular(20)
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
                            ),*/

                          ],
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

