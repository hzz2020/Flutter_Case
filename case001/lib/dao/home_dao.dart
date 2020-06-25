import 'dart:async';
import 'dart:convert';

import 'package:case001/model/home_model.dart';
import 'package:http/http.dart' as http;

const HOME_BANNER_URL = 'https://gank.io/api/v2/banners';

///首页大接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_BANNER_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print(result);
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load banner data');
    }
  }

}
