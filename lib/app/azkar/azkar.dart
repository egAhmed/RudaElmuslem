import 'package:flutter/material.dart';

import 'components/body.dart';


class Azkar extends StatefulWidget {
  Azkar({Key? key}) : super(key: key);

  @override
  _AzkarState createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(),);
  }
}