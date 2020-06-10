import 'package:flutter/material.dart';
import 'drawer_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Case',),
        ),
        body: Center(
          child: Text('进来了'),
        ),
        drawer: DrawerPage(),
      ),
    );
  }
}
