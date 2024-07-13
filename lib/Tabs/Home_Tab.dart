import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Categoriy%20Screen/Category_Widget.dart';
import 'package:provider/provider.dart';
import '../API/Api_manager.dart';
import '../Model/Sources_Responses.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Providers/Setting_Provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedtabbar = 0;

  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,

        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.subtitle,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 3,),
            Text(
              AppLocalizations.of(context)!.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder<SourcesResponses>(
            future: ApiManager.getSources(categoryId: 'general',language:settingsprovider.currentlanguage ),
            builder: (buidContext, snapshot) {
              var sources = snapshot.data?.sources;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error Loading News${snapshot.error.toString()}'),
                );
              }
              if (snapshot.data?.status == 'error') {
                return Center(
                  child: Text('Server Error: ${snapshot.data?.message}'),
                );
              }
              return CategoryWidget(sources!);
            }),
      ),
    );
  }
}
