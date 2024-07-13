import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/Api_manager.dart';
import 'package:news_app/Model/Sources_Responses.dart';
import 'package:provider/provider.dart';
import '../Providers/Setting_Provider.dart';
import 'Category_GridView.dart';
import 'Category_Widget.dart';
class CategorieItemScreen extends StatelessWidget {

Category category;

  CategorieItemScreen(this.category);

  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<SettingsProvider>(context);
    return Container(
      child: FutureBuilder<SourcesResponses>(
          future: ApiManager.getSources(categoryId:category.id,language:settingsprovider.currentlanguage ),
          builder: (buidContext,snapshot){
            var sources=snapshot.data?.sources;
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
            return CategoryWidget(sources!);
          }
      ),

    );
  }
}
