
import 'package:news_app/Model/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Israel Gaza: UN warning that aid system could collapse if UNRWA funding is withheld"
/// description : "Top officials issue a joint appeal after countries halt funding for the territory's main aid agency."
/// url : "https://www.bbc.co.uk/news/world-middle-east-68150519"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/1561C/production/_132508578_womangetty.jpg"
/// publishedAt : "2024-01-31T02:29:47Z"
/// content : "Top UN officials have warned that the withdrawal of funding for its main aid agency in Gaza could lead to the \"collapse of the humanitarian system\".\r\nThey spoke out after the US, UK and other countri… [+2744 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}
