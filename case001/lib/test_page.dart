import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {

  String title;
  TestPage(this.title);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}

