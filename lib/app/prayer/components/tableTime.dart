import 'package:flutter/material.dart';
import 'package:rudaelmoslem/constants/staticVirable.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

class TebleTime extends StatelessWidget {
  const TebleTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        textDirection: TextDirection.ltr,
        //textBaseline: TextBaseline.alphabetic,
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        // columnWidths: {0: FractionColumnWidth(.05),
        //   1: FractionColumnWidth(.125),
        //   2: FractionColumnWidth(.125),
        //   3: FractionColumnWidth(.4),
        //   4: FractionColumnWidth(.2),
        //   5: FractionColumnWidth(.02)},
        children: [
        
          tabelWidget(
            title: "Fajer.",
            titleAr: 'الفجر',
            time: intl.DateFormat.jm().format(
              PrayerGlobalVariables.NextPrayerFajer).toString(),
          ),
          
          TableRow(
            children: [
              Divider(),
              Divider(),
              Divider(endIndent: 20.0.w,),
            ]
          ),
          tabelWidget(
            title: "Dhuhr",
            titleAr: 'الظهر',
            time: intl.DateFormat.jm().format(
              PrayerGlobalVariables.NextPrayerDhuhre).toString(),
          ),
          TableRow(
            children: [
              Divider(),
              Divider(),
              Divider(endIndent: 20.0.w,),
            ]
          ),
          tabelWidget(
            title: "Asr",
            titleAr: 'العصر',
            time: intl.DateFormat.jm().format(
              PrayerGlobalVariables.NextPrayerAser).toString(),
          ),
          TableRow(
            children: [
              Divider(),
              Divider(),
              Divider(endIndent: 20.0.w,),
            ]
          ),
          tabelWidget(
            title: "Maghrib",
            titleAr: 'المغرب',
            time: intl.DateFormat.jm().format(
              PrayerGlobalVariables.NextPrayerMaghrib).toString(),
          ),
          TableRow(
            children: [
              Divider(),
              Divider(),
              Divider(endIndent: 20.0.w,),
            ]
          ),
          tabelWidget(
            title: "Isha",
            titleAr: 'العشاء',
            time: intl.DateFormat.jm().format(
              PrayerGlobalVariables.NextPrayerIsha).toString(),
          ),
      ],
    ),
    );
  }
TableRow tabelWidget({required String title,required String titleAr, required String time}){
    return TableRow(
       decoration: BoxDecoration(
         //border: Border.symmetric(horizontal: BorderSide(width: 2))
         shape: BoxShape.rectangle,
         //border: Border(bottom: BorderSide(width: 2, style: BorderStyle.solid)),
       ),
      children: [
        
        Container(
          height: 5.0.h,
          alignment: Alignment.centerLeft,
          child: Text(
            title,
          ),
        ),
        //SizedBox(width: 15.0.w,),
        Container(
          height: 5.0.h,
          alignment: Alignment.centerLeft,
          child: Text(
            time,
          ),
        ),
        //SizedBox(width: 15.0.w,),
        Container(
          height: 5.0.h,
          alignment: Alignment.centerLeft,
          child: Text(
            titleAr,
          ),
        ),
      ]
    );
  }
}