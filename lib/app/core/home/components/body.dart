import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';
import '../components/scrn_landscape.dart';
import '../components/scrn_portrait.dart';

class Body extends StatefulWidget {


  

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  //final _nativeAdController = NativeAdmobController();
  
  @override
  void initState() {
    super.initState();
    
    //_nativeAdController.setAdUnitID(AdServices.nativeAdvansId);

  }
   @override
  void dispose() {
    
    //_nativeAdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  ScrnPortrait();
    // SizerUtil.orientation == Orientation.portrait
    // //      ? ScrnPortrait()
    //       : ScrnLandScape();
    // return BlocProvider(
    //  create: (context) {
    //     return SalahBloc()..add(const RequestedMonthEvent());
    //   },
    //   child: BlocBuilder<SalahBloc, SalahState>(
    //     builder: (BuildContext context, SalahState state){
    //       if (state is RequestSuccessMonthState) {
            
    //       }
    //       else {
    //           return LoadingIndicator(); //SalahSkeletonWidget();
    //         }
        
    //    },
    //   ),
      
    // );
  }

  Widget adsContainer() {
    return Container(
      //You Can Set Container Height
      padding: EdgeInsets.symmetric(vertical: 1.0.h,horizontal: 1.0.w),
      //color: Colors.amber,
      //width: 80.0.w,
      alignment: Alignment.center,
      child: Card(
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 30.0.h,
          width: 100.0.w,
          // child: NativeAdmob(
          //   // Your ad unit id
          //   adUnitID: AdServices.nativeAdvansId,
          //   controller: _nativeAdController,
          //   type: NativeAdmobType.full,
          //   error: CupertinoActivityIndicator(),
          // ),
        ),
      ),
    );
  }
}