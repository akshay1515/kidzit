import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final subtree = Text("Hello World");


    /*we can also prevent rebuilding of widget by using packages like provider

    * Consumer
    * Selector

    * */

    return Column(
      children: [
        // Stop Widget rebuilding using const keyword.
        const DecoratedBox(
          decoration: BoxDecoration(),
          child: Text("Hello World"),
        ),

        //using final keyword to prevent widget rebuild
        subtree


      ],
    );
  }
}
