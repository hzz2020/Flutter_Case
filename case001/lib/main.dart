import 'package:flutter/material.dart';
import 'load_page.dart';
import 'app.dart';
import 'search_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'case001',
      theme: ThemeData(
        primaryColor: Colors.blue[600],
        primarySwatch: Colors.blue,
      ),
      home: LoadPage(),
      routes: <String, WidgetBuilder> {
        "app" : (BuildContext context) => App(),
        "search" : (BuildContext context) => SearchPage(),
      },
    );
  }
}

