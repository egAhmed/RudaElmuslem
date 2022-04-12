import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rudaelmoslem/provider/ThemeController.dart';


class ThemesPage extends StatefulWidget {
  const ThemesPage({Key? key}) : super(key: key);
  @override
  _ThemesPageState createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1090));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Builder(
                builder: (context) {
                  bool _isDarkMode =
                      Theme.of(context).brightness == Brightness.dark;
                  if (_isDarkMode) {
                    _animationController!.forward();
                  } else {
                    _animationController!.reverse();
                  }
                  return Center(
                    child: AnimatedMoon(
                      animationController: _animationController,
                      width: MediaQuery.of(context).size.width,
                      isDarkMode: _isDarkMode,
                    ),
                  );
                },
              ),
            ),
          ),
          const Expanded(child: ThemesOption()),
        ],
      ),
    );
  }
}

class AnimatedMoon extends StatelessWidget {
  AnimatedMoon({
    Key? key,
    this.width,
    this.isDarkMode,
    AnimationController? animationController,
  })  : _animationController = animationController,
        super(key: key);

  final double? width;
  final bool? isDarkMode;
  final AnimationController? _animationController;

  final List<Color> lightSwatches = [
    const Color(0xDDFF0080),
    const Color(0xDDFF8C00),
  ];

  final List<Color> darkSwatches = [
    const Color(0xFF8983F7),
    const Color(0xFFA3DAFB),
  ];

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.6,
      child: Stack(
        children: <Widget>[
          Container(
            width: width! * 0.35,
            height: width! * 0.35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: isDarkMode! ? darkSwatches : lightSwatches,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(40, 0),
            child: ScaleTransition(
              scale: _animationController!.drive(
                Tween<double>(begin: 0.0, end: 1.0).chain(
                  CurveTween(curve: Curves.decelerate),
                ),
              ),
              alignment: Alignment.topRight,
              child: Container(
                width: width! * 0.26,
                height: width! * 0.26,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemesOption extends StatefulWidget {
  const ThemesOption({Key? key}) : super(key: key);
  @override
  _ThemesOptionState createState() => _ThemesOptionState();
}

class _ThemesOptionState extends State<ThemesOption> {
  final Map<String, ThemeMode> _themeOptions = {
    'onefirst.page2.text1'.tr(): ThemeMode.system,
    'onefirst.page2.text2'.tr(): ThemeMode.light,
    'onefirst.page2.text3'.tr(): ThemeMode.dark
  };
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, setting, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _themeOptions.length,
          itemBuilder: (context, index) {
            return RadioListTile(//restr app
                title: Text(_themeOptions.keys.elementAt(index)),
                subtitle:
                    index == 0 ?  Text( 'onefirst.page2.text4'.tr()) : null,
                value: _themeOptions.values.elementAt(index),
                groupValue: setting.themeMode,
                onChanged: (dynamic value) {
                  setting.themeMode = value;
                });
          },
        );
      },
    );
  }
}
