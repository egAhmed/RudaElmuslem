import 'package:flutter/material.dart';



//Dashboard
late BuildContext contextDashboard;
var mediaMainDash = MediaQuery.of(contextDashboard);
final double continarImagrHieght = mediaMainDash.size.height *0.4;
final double continarDownImagrHieght = mediaMainDash.size.height *0.1 -15;
final double continarTitleHieght = mediaMainDash.size.height*0.35;

//DashList
late BuildContext contextDashList;
var mediaMainDashList = MediaQuery.of(contextDashList).size;
final double dashListHieght = mediaMainDashList.height ;
final double dashListWidth = mediaMainDashList.width;
final double imageHieghtDash = mediaMainDashList.height*0.15 ;//.height*0.06
final double boxSizeHieghtDash = mediaMainDashList.height*0.06 ;//.height*0.06
final double listHieght = mediaMainDashList.height - mediaMainDashList.height*0.2  ;



// main Card
late BuildContext contextCard;
var mediaMainCard = MediaQuery.of(contextCard);
final double hightCardBody = mediaMainCard.size.height;
final double widthCardBody = mediaMainCard.size.width;
final EdgeInsets safeAreaMinimum = EdgeInsets.only(bottom: hightCard/3.5);
final double hightCard = mediaMainCard.size.height;
final double widthCard = mediaMainCard.size.width;
//final double imgCardHigth = 500.0;
//final double positionedCard = mediaMainCard.size.height/12; // 70.0;


// ----------  prayer
late BuildContext prayerWidgit1Context;
var prayerWidgit1MediaQuery = MediaQuery.of(prayerWidgit1Context).size;
final double customPrayerHeight = prayerWidgit1MediaQuery.height *0.9;
final double customPrayer1Width =prayerWidgit1MediaQuery.width*0.92;

// index item
final double hightItem = 70.0;
final double widthtItemContaner = 60.0;
