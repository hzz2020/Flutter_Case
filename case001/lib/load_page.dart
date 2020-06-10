import 'package:flutter/material.dart';
import 'app.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) {
            return App();
          }), (route) => route == null);
        }
      },
    );
    /// 启动动画
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591597195374&di=7971e282e3e1ec18eddd56de7e7d077d&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fmobile%2F2017-12-06%2F5a278f55741d1.jpg', fit: BoxFit.cover,),
    );
  }
}
