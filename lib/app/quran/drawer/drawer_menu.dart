import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';
import 'package:rudaelmoslem/provider/drawer_provider.dart';
import 'package:rudaelmoslem/theme/app_color.dart';


import 'drawer.dart';

class DrawerMenuScreen extends StatefulWidget {
  final List<MenuItem> mainMenu;
  final Function(int)? callback;
  final int? current;
  final String? user;

  DrawerMenuScreen(
    this.mainMenu, {
    Key? key,
    this.callback,
    this.current,
    this.user
  });

  @override
  _DrawerMenuScreenState createState() => _DrawerMenuScreenState();
}

class _DrawerMenuScreenState extends State<DrawerMenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  final widthBox = SizedBox(
    width: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    final TextStyle androidStyle = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
    final TextStyle iosStyle = const TextStyle(color: Colors.white);
    final style = kIsWeb? androidStyle: Platform.isAndroid ? androidStyle : iosStyle;

    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return Scaffold(
          body: Container(
            //color: Colors.white10,
            decoration: BoxDecoration(
              gradient:value.themeMode == ThemeMode.light? LinearGradient(
                colors: [Color(0xFF576BDA),ColorUtil.minColor,],//ColorApp.gradientDrawer,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ):LinearGradient(
                colors: [Colors.white10,Colors.white10,],//ColorApp.gradientDrawer,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 24.0, left: 24.0, right: 24.0),
                    child: GestureDetector(
                      onTap: (){
                        DrawerApp.of(context)!.close();
                        //Navigator.pushNamed(context, '/base',arguments: UserProfile());
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/icons/icon.png'),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       bottom: 36.0, left: 24.0, right: 24.0),
                  //   child: Text(
                  //     //tr("name"),
                  //     "widget.user",
                  //     style: TextStyle(
                  //       fontSize: 22,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.w900,
                  //     ),
                  //   ),
                  // ),
                  
                  Selector<DrawerMenuProvider, int>(
                    selector: (_, provider) => provider.currentPage,
                    builder: (_, index, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ...widget.mainMenu
                            .map((item) => MenuItemWidget(
                                  key: Key(item.index.toString()),
                                  item: item,
                                  callback: widget.callback,
                                  widthBox: widthBox,
                                  style: value.themeMode == ThemeMode.dark?Theme.of(context).textTheme.headline5:
                                  Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                                  selected: index == item.index,
                                ))
                            .toList()
                      ],
                    ),
                  ),

                  Spacer(),
                  
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  //   child: OutlineButton(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //         // tr("logout"),
                  //         'ds',
                  //         style: TextStyle(fontSize: 18),
                  //       ),
                  //     ),
                  //     borderSide: BorderSide(color: Colors.white, width: 2.0),
                  //     onPressed: () async{
                  //       DrawerApp.of(context)!.close();
                  //       //await FirebaseAuth.instance.signOut();
                  //       //Navigator.pushReplacementNamed(context, '/signin',);
                  //     },
                  //     textColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(16.0)),
                  //   ),
                  // ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem? item;
  final Widget? widthBox;
  final TextStyle? style;
  final Function? callback;
  final bool? selected;

  final white = Colors.white;

  const MenuItemWidget(
      {Key? key,
      this.item,
      this.widthBox,
      this.style,
      this.callback,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
            builder: (context, value, child) {
        return TextButton(
          onPressed:() => callback!(item!.index),
          //color: selected! ? Color(0x44000000) : null,
          style: ButtonStyle(
            backgroundColor:value.themeMode==ThemeMode.light? MaterialStateProperty.all(selected! ? Colors.amber : null,):
            MaterialStateProperty.all(selected! ? Colors.white30 : null,)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                item!.icon,
                color:value.themeMode == ThemeMode.dark? Color(0xffDBDEF2):white,
                size: 24,
              ),
              widthBox!,
              Expanded(
                child: Text(
                  item!.title,
                  style: style,
                ),
              )
            ],
          ),
        );
      }
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final Function()? onPress;
  final int index;

  const MenuItem(this.title, this.icon, this.index,this.onPress);
}