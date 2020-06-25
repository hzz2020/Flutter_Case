import 'package:case001/home_page.dart';
import 'package:case001/test_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  // pages
  List<Widget> _pages = List();
  // items
  List<BottomNavigationBarItem> _items = List();
  // current页面
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _items
      ..add(_bottomBarItem('首页', 0, Icons.home))
      ..add(_bottomBarItem('分类', 1, Icons.category))
      ..add(_bottomBarItem('购物车', 2, Icons.shopping_cart))
      ..add(_bottomBarItem('我的', 3, Icons.person));

    _pages
      ..add(HomePage('首页'))
      ..add(TestPage('分类'))
      ..add(TestPage('购物车'))
      ..add(TestPage('我的'));
  }

  /// bottomBarItem
  _bottomBarItem(String title, int index, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(
        title,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            print('点击了第${index+1}个');
            _currentIndex = index;
          });
        },

      ),
      body: PageView(
        controller: _controller,
        children: _pages,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

