import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Providers/Setting_Provider.dart';
import 'package:provider/provider.dart';
import '../../Theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingProvider =Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight:  Radius.circular(20)
        ),
        color: settingProvider.isDarkmode()? MyTheme.Secondrycolor:Colors.white,
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              settingProvider.ChangeTheme(ThemeMode.light);
            },
            child: settingProvider.isDarkmode()?
            unselectedTheme(AppLocalizations.of(context)!.light)
            :selectedTheme(AppLocalizations.of(context)!.light),
          )


          ,SizedBox(height: 20,),

          InkWell(
            onTap: (){
              settingProvider.ChangeTheme(ThemeMode.dark);
            },
            child: settingProvider.isDarkmode()?
            selectedTheme(AppLocalizations.of(context)!.dark)
                :unselectedTheme(AppLocalizations.of(context)!.dark),
          )


        ],
      ),
    );
  }

  Widget selectedTheme(String theme){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).primaryColor),),

      ] ,
    ) ;
  }

  Widget unselectedTheme(String theme){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme,style: Theme.of(context).textTheme.headlineMedium,),
      ] ,
    );
  }
}
