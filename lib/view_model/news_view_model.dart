

import 'package:news_api/models/news_channels_headlines_model.dart';
import 'package:news_api/repository/news_repository.dart';

class NewsViewModel {


  final _rep = NewRepository();
  Future<NewsChannelsHeadlinesModel>  FetchNewChannelHeadlinesApi()async{
    final response = await _rep.fetchNewChannelHeadlinesApi();
    return response;
  }
}