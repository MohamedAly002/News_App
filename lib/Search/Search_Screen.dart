import 'dart:core';

import 'package:flutter/material.dart';
import 'package:news_app/API/Api_manager.dart';
import 'package:news_app/News/News_Item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Model/News.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";
  List<News> searchNewsList = [];
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        leading: SizedBox(),
        leadingWidth: 10,
        title: TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          controller: _controller,
          onChanged: (String value) {
            setState(() {
              query = value;
            });
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppLocalizations.of(context)!.searchHint,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              prefixIcon: IconButton(
                onPressed: () {
                  _controller.clear();
                },
                icon: Icon(Icons.close),
                color: Theme.of(context).primaryColor.withOpacity(0.7),
              )),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => NewsItem(Search().elementAt(index)),
        itemCount: Search()?.length??0,
      ),
    );
  }

  List Search() {
    ApiManager.getNews(query: query)
      ..then((NewsResponse) {
        searchNewsList = NewsResponse.NewsList ?? [];
      }).catchError((error) {
        debugPrint("error calling api : ${error}");
      });
    return searchNewsList;
  }
}
