import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/News.dart';
import '../Providers/Date_Format.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'NewsDetails';
  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)!.settings.arguments as News;
    var TimePublishedAt = DateTime.parse(news.publishedAt ?? "");
    var TimeFormating=new DateFormating(news);
    final Uri newsUrl = Uri.parse(news.url ?? "");

    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Container(
          child: ClipRRect(
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height * 0.4,
              imageUrl: news.urlToImage ?? '',
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(news.author ?? 'Unknown Author',
                  style:Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 10,
              ),
              Text(
                news.title ?? 'Unknown Title',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text("${TimeFormating.formatingPublishedAt(TimePublishedAt)}",
                  style:Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.end),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(news.description ?? '',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              InkWell(
                onTap: () {
                  _launchUrl(newsUrl);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Read more ',
                      style:Theme.of(context).textTheme.headlineMedium,
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 30,color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
