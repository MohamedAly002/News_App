
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/News/News_Details.dart';
import 'package:news_app/Providers/Setting_Provider.dart';
import 'package:news_app/Search/Search_Screen.dart';
import 'package:news_app/Theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'Tabs/Categories_Tab.dart';
import 'Home/Home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (buildcontext)=>SettingsProvider(),
      child:MyApplication()
  ));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsprovider.currentlanguage),
      debugShowCheckedModeBanner: false,
      theme: MyTheme.LightTheme,
      darkTheme: MyTheme.DarkTheme,
      themeMode:settingsprovider.currentTheme ,
      title: 'News App',
      routes: {
        CategoriesScreen.routeName:(_)=>CategoriesScreen(),
        Home.routeName:(_)=>Home(),
        NewsDetails.routeName:(_)=>NewsDetails(),
        SearchScreen.routeName:(_)=>SearchScreen()
      },
      initialRoute:Home.routeName,
    );
  }
}

