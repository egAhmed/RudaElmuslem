import 'package:flutter/material.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class SearchField extends StatefulWidget {
  final String? hintText;

  SearchField({
    Key? key,
    this.hintText
    }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 15.0.h,
      child: Container(
        width: 90.0.w,
        height: 8.0.h,
        //margin: EdgeInsets.only(bottom: 2.0.h),
        decoration: BoxDecoration(
          color: Colors.white12,//---------------
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Center(
          child: Container(
            width: 70.0.w,
            child: TextField(
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                icon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: widget.hintText 
              ),
              autofocus: false,
              focusNode: FocusNode(canRequestFocus: false),
              onChanged: (v){
                
              },
            ),
          ),
        ),
      ),
    );
  }
}