
import 'package:flutter/material.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class ViewrArea extends StatefulWidget {

  final String? titleArea;
  final Function? onSeeMore;
  final String? sourceJson;
  final double? hieght;
  final Function(BuildContext,AsyncSnapshot<String>)? builder;

  ViewrArea({
    Key? key,
    this.builder,
    this.onSeeMore,
    this.sourceJson,
    this.titleArea,
    this.hieght
    }) : super(key: key);

  @override
  _ViewrAreaState createState() => _ViewrAreaState();
}

class _ViewrAreaState extends State<ViewrArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hieght,
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: ListTile(
              title: Text(
                widget.titleArea!,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              trailing: TextButton(
                  child: Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.indigo
                    ),
                  ),
                  style: ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(Size(10.0.w, 3.0.h)),
                    //backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple.withOpacity(0.2)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.only(left: 5.0, right: 5.0,top: 0.0,bottom: 0.0),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                      fontSize: 8.0.sp,
                      fontWeight: FontWeight.bold,
                      //color: Colors.deepPurple
                    )), 
                  ),
                  onPressed: widget.onSeeMore as void Function()?,
                ),
              ),
          ),

          // Expanded(
          //   child: FutureBuilder(
          //     future: DefaultAssetBundle.of(context).loadString(widget.sourceJson),
          //     builder: widget.builder,
          //   )
          // ),
        ],
      ),
    );
  }
}