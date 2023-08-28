import 'package:dio/dio.dart';
import 'package:newsapp/model/article_model.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);


  String apiKey='6d02f46eda3b450586654e98f8fc143a';
  String endPoint='/v2/everything?q';
 Future<List<ArticleModel>?> getNews({required String category}) async {
   try{
     Response response = await dio.get(
         'https://newsapi.org$endPoint=$category&apiKey=$apiKey');
     Map<String, dynamic> jsonData = response.data;
     List<dynamic> articles = jsonData['articles'];
     List<ArticleModel> articlesList = [];
     for (var article in articles) {
       ArticleModel articleModel = ArticleModel(
           image: article['urlToImage'],
           title: article['title'],
           description: article['description']);
       articlesList.add(articleModel);
     }
     return articlesList;
   }catch(e){
     return [];
   }
  }

  void getSportsNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/everything?apiKey=6d02f46eda3b450586654e98f8fc143a&q=1&language=ar#');
    print(response);
  }
}
