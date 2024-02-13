import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:news_api/models/news_channels_headlines_model.dart';


class NewRepository {

  Future<NewsChannelsHeadlinesModel>  fetchNewChannelHeadlinesApi()async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=c85df3836196453a8ace3e4c121609a9';
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final  body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }else{
      throw Exception('Error');
    }
  }
}