import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tatadigitaltest/settingpage.dart';
import 'package:tatadigitaltest/themedata.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {


  const HomePage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showdialog(context);
              },
              icon: Icon(Icons.brightness_medium_rounded))
        ],
      ),
      body: Column(
        children: [
          Observer(builder: (context){
            return  Center(
              child: Card(
                child: ListTile(
                  title: Text("The Current Theme is: ${context.watch<Themedata>().themeString}"),
                ),
              ),
            );
          }),
          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
          },color: Colors.deepPurple,textColor: Colors.white,)
        ],
      )
    );
  }

  void showdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return Observer(builder: (context){
            final theme = context.read<Themedata>();
            return SimpleDialog(
              title: Text("Select Theme"),
              children: <Widget>[
                ListTile(
                  title: Text("Light Theme"),
                  leading: Radio<ThemeType>(
                    value: ThemeType.light,
                    groupValue: theme.currentThemeType,
                    onChanged: (ThemeType? value) {
                      theme.changeCurrentTheme(value!);
                    },
                  ),
                ),
                ListTile(
                    title: Text("Dark Theme"),
                    leading: Radio<ThemeType>(
                      value: ThemeType.dark,
                      groupValue: theme.currentThemeType,
                      onChanged: (ThemeType? value) {
                        theme.changeCurrentTheme(value!);
                      },
                    ))
              ],
            );
          });
        });
  }
}
