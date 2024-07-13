import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/Api_manager.dart';
import 'package:news_app/Model/News_Response.dart';
import 'package:news_app/Model/Source.dart';
import 'package:news_app/News/News_Item.dart';
import 'package:provider/provider.dart';

import '../Providers/Setting_Provider.dart';

class NewsList extends StatelessWidget {
Source source;
NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<SettingsProvider>(context);

    return  Container(
      child: FutureBuilder<NewsResponse>(
          future: ApiManager.getNews(sourceId:source.id??'',language: settingsprovider.currentlanguage),
          builder: (buidcontext,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Center(child: Text('Error Loading News${
                  snapshot.error.toString()}'),);
            }
            if (snapshot.data?.status=='error'){
              return Center(child: Text('Server Error${
                  snapshot.data?.message}'),);
            }
            var newsList=snapshot.data?.NewsList;
            return ListView.builder(itemBuilder: (_,index){
              return NewsItem(newsList![index]);
            },
            itemCount:newsList?.length ??0 ,);
          }
      ),
    );
  }
}
