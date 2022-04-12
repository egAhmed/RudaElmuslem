import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class SuraItemList extends StatelessWidget {

  final String? title;
  final String? titleAr;
  final String? supTitle;
  final String? numSura;
  final Function? onTap;

  const SuraItemList({Key? key,
   this.title, this.titleAr, this.supTitle, this.numSura,this.onTap}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Directionality(
               textDirection: TextDirection.ltr,
          child: Container(
            child: ListTile(
              onTap: onTap as void Function()?,
              title: Text(
                title!,
                softWrap: true,
                style: Theme.of(context).textTheme.headline4
              ),
              trailing: Text(
                titleAr!,
                style: Theme.of(context).textTheme.headline4 //mada
              ),
              subtitle: Text(
                supTitle!,
                style: Theme.of(context).textTheme.headline6
              ),
              leading:  Container(
              height: 5.0.h,
              width: 5.0.h,
              child: Stack(
                children: [
                  Container(      
                    child: SvgPicture.asset(
                      'assets/svg/Decorative-Ornamental-Flourish-Frame-Extrapolated.svg',
                      color:value.themeMode == ThemeMode.dark?Color(0xffDBDEF2): Color(0xff235c60),
                      fit: BoxFit.fill,
                    ),
                  ),

                  Center(
                    child: Text(
                      numSura!,
                      style: Theme.of(context).textTheme.headline5
                    ),
                  )
                ],
              ),
            ),
            ),
          ),
        );
      }
    );
  }
}