import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:news_app/Model/News_Response.dart';
import 'package:news_app/Model/Sources_Responses.dart';
class ApiManager{
  static const String baseUrl='newsapi.org';
  static const String apiKey='79e50137d73244faa2fece7ba9fe8aac';

  static Future<SourcesResponses>getSources({String? categoryId ,String? language})async{
    var Url=Uri.https(baseUrl,'/v2/top-headlines/sources',{

     'apiKey':apiKey,
      'category':categoryId,
      'language':language,
    });
    var response= await http.get(Url);
    return SourcesResponses.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews({String? sourceId,String? query,String? language})async{
    var Url=Uri.https(baseUrl,'/v2/everything',{
      'sources':sourceId,
    'apiKey':apiKey,
      'q':query,
      'language':language,


    });
    var response=await http.get(Url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }



}