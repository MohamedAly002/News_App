import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Providers/Setting_Provider.dart';
import 'package:provider/provider.dart';
import '../../Theme/my_theme.dart';


class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
              settingProvider.ChangeLanguage('es');
            },
            child: settingProvider.islangEN()?
            unselectedlang('Spanish')
            :selectedlang('Spanish'),
          )


          ,SizedBox(height: 20,),

          InkWell(
            onTap: (){
              settingProvider.ChangeLanguage('en');
            },
            child: settingProvider.islangEN()?
            selectedlang('English')
                :unselectedlang('English'),
          )


        ],
      ),
    );
  }

  Widget selectedlang(String lang){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lang,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).primaryColor),),

      ] ,
    ) ;
  }

  Widget unselectedlang(String lang){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lang,style: Theme.of(context).textTheme.headlineMedium,),
      ] ,
    );
  }
}
