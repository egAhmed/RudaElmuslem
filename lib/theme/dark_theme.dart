import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rudaelmoslem/utilts/sizer/sizer.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity:  VisualDensity.adaptivePlatformDensity,//VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xff4A5CC0,
      <int, Color>{
        50: Color(0xffA5ADDF),
        100: Color(0xff939DD9),
        200: Color(0xff818DD3),
        300: Color(0xff6F7DCC),
        400: Color(0xff5C6CC6),
        500: Color(0xff4A5CC0),
        600: Color(0xff3F50B3),
        700: Color(0xff3848A1),
        800: Color(0xff32408F),
        900: Color(0xff2B377B)
      },
    ),
    primaryColorBrightness: Brightness.dark,
    primaryColor:  Color(0xff4A5CC0),
    primaryColorLight: Color(0xff6F7DCC),
    primaryColorDark: Color(0xff2B377B),

    backgroundColor: Color(0xFF161C3E),
    scaffoldBackgroundColor: Color(0xFF161C3E),

    canvasColor: Color(0xffE09E45),
    //accentColor: Color(0xff457BE0),
    //accentColorBrightness: Brightness.dark,
    
    bottomAppBarColor: Color(0xff3848A1),
    cardColor: Colors.white10,
    dividerColor: Color(0xff939DD9),

    focusColor: Color(0xffA5ADDF),
    hoverColor: Color(0xffffffff),
    highlightColor: Color(0xffA5ADDF),
    splashColor: Color(0xff4A5CC0),

//  splashFactory: # override create method from  InteractiveInkFeatureFactory
    selectedRowColor: Colors.grey,
    unselectedWidgetColor: Colors.grey.shade400,
    disabledColor: Colors.grey.shade200,

    buttonTheme: ButtonThemeData(
      //colorScheme: ColorScheme.dark(background: Color(0xff939DD9)),
      buttonColor: Color(0xff939DD9)
      //textTheme: ButtonTextTheme.accent,
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
     //toggle button theme
    ),
    //buttonColor: Color(0xff483112),
    //textButtonTheme: TextButtonTheme.,
    
    secondaryHeaderColor: Colors.grey,
    // textSelectionColor: Color(0x1a483112),
    // cursorColor: Color(0xff483112),
    // textSelectionHandleColor: Color(0xff483112),
    
    dialogBackgroundColor: Color(0xffDEE1F3),
    indicatorColor: Color(0xff4A5CC0),//0xff4A5CC0 0xff6F7DCC
    hintColor: Colors.grey,
    errorColor: Colors.red[300],
    toggleableActiveColor: Color(0xff6D42CE),
    
    textTheme: TextTheme(
      //text themes that contrast with card and canvas
      overline: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 25.0.sp,
      ),
      headline6: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 6.0.sp,
      ) ,
      headline5: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 8.0.sp,
      ),
      headline4: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 12.0.sp,
      ),
      headline3: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 14.0.sp,
      ),
      headline2: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 16.0.sp,
      ),
      headline1: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 18.0.sp,
      ),
      subtitle1: TextStyle(
        color:Color(0xffDBDEF2),
        //fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 12.0.sp,
      ),
      subtitle2: TextStyle(
        color:Color(0xffDBDEF2),
        //fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 8.0.sp,
      ),
      button: TextStyle(
        color:Color(0xffDBDEF2),
      ),
    ),
    primaryTextTheme: TextTheme(
      //text theme that contrast with primary color
      headline1: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 30.0.sp,
      ),
      headline2: TextStyle(
        color:Color(0xffDBDEF2),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 20.0.sp,
      ),
      headline5: TextStyle(
        color:Color(0xffDBDEF2),
        //fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 8.0.sp,
      ),
      button: TextStyle(
        color: Color(0xffA5ADDF),
      ),
      overline: TextStyle(
        color:Color(0xffDBDEF2),
      ),
      subtitle1: TextStyle(
        color:Color(0xFFA0A2B1),
        //fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 12.0.sp,
      ),
      subtitle2: TextStyle(
        color:Color(0xFFA0A2B1),
        //fontFamily: 'Cairo',
        fontWeight: FontWeight.w900,
        fontSize: 8.0.sp,
      ),
    ),

    
    radioTheme: RadioThemeData(

    ),
    switchTheme: SwitchThemeData(
      //overlayColor: MaterialStateProperty<Color>()
    ),


    progressIndicatorTheme: ProgressIndicatorThemeData(

    ),
    

    // accentTextTheme: TextTheme(
    //   //text theme that contrast with accent Color
    //     ),
    inputDecorationTheme: InputDecorationTheme(
      // default values for InputDecorator, TextField, and TextFormField
        ),
    iconTheme: IconThemeData(
      //icon themes that contrast with card and canvas
      color: Color(0xffDBDEF2),
    ),
    primaryIconTheme: IconThemeData(
      //icon themes that contrast primary color
        ),
    // accentIconTheme: IconThemeData(
    //     //icon themes that contrast accent color
    //     ),
    sliderTheme: SliderThemeData(
        // slider themes
        ),
    tabBarTheme: TabBarTheme(
        // tab bat theme
        ),
    tooltipTheme: TooltipThemeData(
        // tool tip theme
        ),
    cardTheme: CardTheme(
        // card theme
      color: Color(0x1Affffff), 
      elevation: 0,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      
    ),
    
    chipTheme: ChipThemeData(
        backgroundColor: Color(0xff2F1E06),
        disabledColor: Color(0xa15D4524),
        shape: StadiumBorder(),
        brightness: Brightness.dark,
        labelPadding: EdgeInsets.all(8),
        labelStyle: TextStyle(),
        padding: EdgeInsets.all(8),
        secondaryLabelStyle: TextStyle(),
        secondarySelectedColor: Colors.white38,
        selectedColor: Colors.white
        // chip theme
        ),
    platform: TargetPlatform.android,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    applyElevationOverlayColor: true,
    pageTransitionsTheme: PageTransitionsTheme(
        //page transition theme
        ),
    appBarTheme: AppBarTheme(
      //color:  Color(0xFF576BDA),
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      //toolbarOpacity: 0.3,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
        //app bar theme
    ),
    bottomAppBarTheme: BottomAppBarTheme(
        // bottom app bar theme
        ),
    colorScheme: ColorScheme(
        primary: Color(0xff4A5CC0),
        primaryVariant: Color(0x1a311F06),
        secondary: Color(0xff457BE0),
        secondaryVariant: Color(0xaa457BE0),
        brightness: Brightness.dark,
        background: Color(0xffB5BFD3),
        error: Colors.red,
        onBackground: Color(0xffB5BFD3),
        onError: Colors.red,
        onPrimary: Color(0xff4A5CC0),
        onSecondary: Color(0xff457BE0),
        onSurface: Color(0xff457BE0),
        surface: Color(0xff457BE0),
    ),
    snackBarTheme: SnackBarThemeData(
        // snack bar theme
        ),
    dialogTheme: DialogTheme(
        // dialog theme
      elevation: 50.0,
      backgroundColor: Color(0xffDEE1F3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // floating action button theme
        ),
    navigationRailTheme: NavigationRailThemeData(
        // navigation rail theme
        ),
    typography: Typography.material2018(),
    cupertinoOverrideTheme: CupertinoThemeData(
        //cupertino theme
        ),
    bottomSheetTheme: BottomSheetThemeData(
        //bottom sheet theme
        ),
    popupMenuTheme: PopupMenuThemeData(
        //pop menu theme
        ),
    bannerTheme: MaterialBannerThemeData(
        // material banner theme
        ),
    dividerTheme: DividerThemeData(
        //divider, vertical divider theme
      indent: 40,
      endIndent: 40,
    ),
    buttonBarTheme: ButtonBarThemeData(
        // button bar theme
        ),
        
    fontFamily: 'ROBOTO',
    splashFactory: InkSplash.splashFactory
    );