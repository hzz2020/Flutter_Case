import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import './model/common_model.dart';
import './model/home_model.dart';
import './dao/home_dao.dart';

class HomePage extends StatefulWidget {
  
  String title;
  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  
  List bannerList = [];
  List menuList = List();

  @override 
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();


    menuList
    ..add(_menuItem())
    ..add(_menuItem());
    /// 下拉刷新数据/默认第一次进来也拉取数据
    _handleRefresh();
  }

  _menuItem() {
    
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        bannerList = model.bannerList;
      });
    } catch (e) {
      print('报异常了,' + e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: RefreshIndicator(
              onRefresh: _handleRefresh,
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  //  if (scrollNotification is ScrollUpdateNotification &&
                  //      scrollNotification.depth == 0) {
                  //    //滚动且是列表滚动的时候
                  //    _onScroll(scrollNotification.metrics.pixels);
                  //  }
                },
                child: _listView,
              ),
            ),
          ),
          // _appBar,
        ],
      ),
    );
  }

  /// 总体的listView
  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
         Padding(
           padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
           child: menuNav(localNavList: localNavList),
         ),
        //  Padding(
        //      padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
        //      child: GridNav(gridNavModel: gridNavModel)),
        //  Padding(
        //      padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
        //      child: SubNav(subNavList: subNavList)),
        //  Padding(
        //  padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
        //  child: SalesBox(salesBox: salesBoxModel)),
      ],
    );
  }

  /// 广告banner条
  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        key: UniqueKey(),
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              CommonModel model = bannerList[index];
              launch(model.url);
            },
            child: Image.network(
              bannerList[index].image,
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}
