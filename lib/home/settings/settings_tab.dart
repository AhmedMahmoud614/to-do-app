

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do/home/settings/themeing_bottom_sheet.dart';
import 'package:to_do/provider/app_config_provider.dart';

import '../../theme.dart';
import 'language_bottom_sheet.dart';

class settingsTab extends StatefulWidget {


  @override
  State<settingsTab> createState() => _settingsTabState();
}

class _settingsTabState extends State<settingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.subtitle2,

          ),
          SizedBox(
            height: 18,
          ),
          Container(

            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
            ),
            child: InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.appLanguage == 'en'?
                  AppLocalizations.of(context)!.english:
                  AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.subtitle1,),
                  Icon(Icons.arrow_drop_down_outlined,size:30 , color: MyThemeData.whiteColor,),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(

            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.subtitle2,

          ),
          SizedBox(
            height: 18,
          ),
          Container(

            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
            ),
            child: InkWell(
              onTap: (){
                showThemeingBottomSheet();           },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(  provider.isDarkMode()?
                  AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.subtitle1,),
                  Icon(Icons.arrow_drop_down_outlined,size:30 , color: MyThemeData.whiteColor,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context)=> LanguageBottomSheet(),
    );
  }

  void showThemeingBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context)=> ThemeingBottomSheet(),
    );
  }
}


