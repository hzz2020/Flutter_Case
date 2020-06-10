import 'package:flutter/material.dart';
import 'test_page.dart';
import 'package:flutter/cupertino.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              '大辉郎',
              style: TextStyle(color: Colors.black, fontSize: 24.0),
            ),
            accountEmail: Text(
              '515042611@qq.com',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                decoration: TextDecoration.underline,
              ),
            ),
            currentAccountPicture: null,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591599171101&di=de81f8cb5963b6ac14b939921227eb9c&imgtype=0&src=http%3A%2F%2Fimage.tupian114.com%2F20160823%2F1431428183.jpg.238.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text('首页'),
            leading: Icon(CupertinoIcons.home),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return TestPage('首页');
              }));
            },
          ),
          ListTile(
            title: Text('设置'),
            leading: Icon(CupertinoIcons.settings),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return TestPage('设置');
              }));
            },
          ),
        ],
      ),
    );
  }
}
