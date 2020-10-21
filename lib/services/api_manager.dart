import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_news/constants/strings.dart';
import 'package:http_news/models/newsInfo.dart';

class API_MANAGER {
  Future<NewsInfo> getNews() async {
    var client = http.Client();
    var newsModel = null;

    try {
      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsInfo.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
    }
    return newsModel;
  }
}
