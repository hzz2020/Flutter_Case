import 'common_model.dart';

class HomeModel {
  final List<CommonModel> bannerList;

  HomeModel(
    {this.bannerList
    });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json['data'] as List;
    print(bannerListJson);
    List<CommonModel> bannerList =
        bannerListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      bannerList: bannerList
    );
  }
}


