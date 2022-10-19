import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tatadigitaltest/homepage.dart';
import 'package:tatadigitaltest/themedata.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);
  final themedata = Themedata();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context){
      return MaterialApp(
        title: "My HomePage",
        theme: context.watch().themedata.currentThemeData,
        home: HomePage(),
      );
    });
  }
}
