import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/News.dart';
import 'package:news_app/News/News_Details.dart';
import 'package:news_app/Providers/Date_Format.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem(this.news);
  @override
  Widget build(BuildContext context) {
    var TimePublishedAt = DateTime.parse(news.publishedAt ?? "");
    var TimeFormating=new DateFormating(news);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: news);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: news?.urlToImage ?? '',
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              Text(news.author ?? 'Unknown author',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center),
              SizedBox(height: 5,),
              Text(
                news.title ?? 'Unknown title',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 5,),
              Text("${TimeFormating.formatingPublishedAt(TimePublishedAt)}",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.end)
            ],
          ),
        ),
      ),
    );
  }


}
