import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/home/settings/settings_tab.dart';
import 'package:to_do/home/tasklist/add_task_bottom_sheet.dart';
import 'package:to_do/home/tasklist/task_list_tab.dart';
import 'package:to_do/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../provider/app_config_provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.toDoList,
        style: Theme.of(context).primaryTextTheme.headline1,
      )),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_task_list.png')),
                label: AppLocalizations.of(context)!.task_list),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_settings.png')),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: MyThemeData.whiteColor, width: 4),
            borderRadius: BorderRadius.circular(30)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    taskListTab(),
    settingsTab(),

  ];

  void addTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddTaskBottomSheet(),
    );
  }
}
