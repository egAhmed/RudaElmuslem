import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/models/saly/radio_model.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';



class CardAudio extends StatelessWidget {
  
  
   final RadioModelChek items;
  final int? groupValue;
  //final value;
  final Function(int?)? onChanged;
  final Function()? onPress;

  const CardAudio({Key? key, required this.items,
    this.groupValue,
     required this.onChanged,
     this.onPress,
     }) : super(key: key);
  //final String title;
  //final Function onPress;

  @override
  Widget build(BuildContext context) {
    
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical:0.2.h),
          child: Row(
            children: [
              Radio(value: items.value!, groupValue: groupValue!, onChanged:onChanged),
              Expanded(
                child: Text(
                  items.title!,
                  style: items.isSelected?
                  value.themeMode == ThemeMode.dark?
                  Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize: 10.0.sp,color: Colors.white):
                  Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize: 10.0.sp,color: Theme.of(context).primaryColor):
                  value.themeMode == ThemeMode.dark?
                  Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize: 10.0.sp,):
                  Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize: 10.0.sp,)
                ),
              ),          
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: IconButton(
                    icon: Icon(Icons.audiotrack),
                    onPressed: items.onPress!,
                  ),
              ),
            ],
          ),
        );
      }
    );
  }
}