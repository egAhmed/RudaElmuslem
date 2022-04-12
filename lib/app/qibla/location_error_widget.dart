
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final box = SizedBox(height: 32);
    final errorColor = Color(0xffb00020);

    return Consumer<ThemeController>(
            builder: (context, value, child){
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Color(0xffd6d6d6),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_off,
                size: 150,
                color: errorColor,
              ),
              box,
              Container(
                child: Text(
                  error!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: errorColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              box,
              SizedBox(
                width: 150,
                height: 40,
                child: RaisedButton(
                  child: Text(
                    "Retry",
                    style: TextStyle(
                      color: Colors.red[300],
                    ),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  onPressed: () {
                    if (callback != null) callback!();
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
