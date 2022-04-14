import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newss_app/model/articles.dart';

String apiKey = "be13eca672c446f58ef2e5e1384e7aa4";
String baseUrl = "https://newsapi.org/v2/top-headlines" ;

// https://newsapi.org/v2/top-headlines?country=us&apiKey=be13eca672c446f58ef2e5e1384e7aa4


class News {
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("error can't get data");
    }
  }

  Future<List<Article>> getNewsByCategory(String category) async {
    List<Article> list;
    String url = '$baseUrl?country=id&category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("error brro");
    }
  }

}
