import 'package:flutter/material.dart';
import 'package:news_app/Providers/Setting_Provider.dart';
import 'package:news_app/Tabs/Setting/Language_Bottom_Sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Theme/my_theme.dart';
import 'Theme_Bottom_Sheet.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 25),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language, style: Theme.of(context).textTheme.headlineMedium,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1,color: MyTheme.Primarycolor,
                  )
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(settingsprovider.islangEN()?'English':'Spanish', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)
                                  ,),
                  ),
                  IconButton(onPressed: (){
                    showLanguageBottomSheet();
                  }, icon: Icon(Icons.keyboard_arrow_down_outlined),color:MyTheme.Primarycolor ,)
                ],
              ) ,
            ),
          ),
          Text(AppLocalizations.of(context)!.theme, style: Theme.of(context).textTheme.headlineMedium),
          InkWell(
            onTap:(){
              showThemeBottomSheet();
            } ,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1,color: MyTheme.Primarycolor)
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(settingsprovider.isDarkmode()?AppLocalizations.of(context)!.dark:AppLocalizations.of(context)!.light, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)
                      ,),
                  ),
                  IconButton(onPressed: (){
                    showThemeBottomSheet();
                  }, icon: Icon(Icons.keyboard_arrow_down_outlined),color:MyTheme.Primarycolor ,)
                ],
              ) ,
            ),
          ),
        ],
      ),
    );
  }
void showThemeBottomSheet(){
    showModalBottomSheet(context: context,
        builder: (buildcontext){
      return ThemeBottomSheet();
        }

    );
}

  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context,
        builder: (buildcontext){
          return LanguageBottomSheet();
        }

    );
  }

}
