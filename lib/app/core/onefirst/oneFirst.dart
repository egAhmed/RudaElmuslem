import 'package:flutter/material.dart';
import 'package:rudaelmoslem/app/core/onefirst/components/body.dart';
import 'package:rudaelmoslem/theme/app_color.dart';


class OneFirstScreen extends StatefulWidget {
  OneFirstScreen({Key? key}) : super(key: key);

  @override
  _OneFirstScreenState createState() => _OneFirstScreenState();
}

class _OneFirstScreenState extends State<OneFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Color(0xff1E1E1E),
      body: Body(),
    );
  }
}