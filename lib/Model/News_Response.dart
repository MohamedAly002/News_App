import 'package:news_app/Model/News.dart';


class NewsResponse {
  NewsResponse({
      this.status, 
      this.totalResults, 
      this.NewsList,});

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      NewsList = [];
      json['articles'].forEach((v) {
        NewsList?.add(News.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  num? totalResults;
  List<News>? NewsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    map['totalResults'] = totalResults;
    if (NewsList != null) {
      map['articles'] = NewsList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
