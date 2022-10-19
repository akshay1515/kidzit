import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tatadigitaltest/themedata.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themedata = context.watch<Themedata>();
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            ThemeType theme = themedata.currentThemeType == ThemeType.light
                ? ThemeType.dark
                : ThemeType.light;
            themedata.changeCurrentTheme(theme);
          },
          color: Colors.deepPurple,
          textColor: Colors.white,
          child: Text("Change Theme"),
        ),
      ),
    );
  }
}
