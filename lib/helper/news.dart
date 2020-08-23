import 'dart:convert';

import 'package:News_App/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];

  
  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=ffd7147445ac452185ca25a6ba6f361b"; 
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if (element["urlToImage"] != null && element["description"] != null ){
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage:element["urlToImage"],
            content: element["content"],
          );

          news.add(articleModel);

        }

      });
    }

  }
  

}

class CategoryNewsClass{

  List<ArticleModel> news = [];

  
  Future<void> getNews(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ffd7147445ac452185ca25a6ba6f361b"; 
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if (element["urlToImage"] != null && element["description"] != null ){
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage:element["urlToImage"],
            content: element["content"],
          );

          news.add(articleModel);

        }

      });
    }

  }
  

}

