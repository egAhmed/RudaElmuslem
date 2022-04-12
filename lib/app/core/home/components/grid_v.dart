import 'package:flutter/material.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

class GridV extends StatefulWidget {
  final Widget? child1;
  final Widget? child2;

  GridV({
    Key? key,
    this.child1,
    this.child2,
    }) : super(key: key);

  @override
  _GridVState createState() => _GridVState();
}

class _GridVState extends State<GridV> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 100.0.w,
       child: Row(
          children: [
            //Spacer(),
            widget.child1!,
            //Spacer(),
            widget.child2!,
            //Spacer(),
          ],
       ),
    );
  }
}

class GridH extends StatefulWidget {
  final Widget? child1;
  final Widget? child2;

  GridH({
    Key? key,
    this.child1,
    this.child2,
    }) : super(key: key);

  @override
  _GridHState createState() => _GridHState();
}

class _GridHState extends State<GridH> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0.h,
      //width: 100.0.w,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Spacer(),
            widget.child1!,
            //Spacer(),
            widget.child2!,
            //Spacer(),
          ],
       ),
    );
  }
}