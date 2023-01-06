import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/home/tasklist/item_task_list.dart';
import 'package:to_do/model/fire_basew_util.dart';
import 'package:to_do/theme.dart';

import '../../model/task.dart';

class taskListTab extends StatefulWidget {
  @override
  State<taskListTab> createState() => _taskListTabState();
}

class _taskListTabState extends State<taskListTab> {
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    getAllTaskFromFireStore();


    return Container(

      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {

              });
            },
            shrink: true,
            leftMargin: 20,
            monthColor: MyThemeData.blackColor,
            dayColor: MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryLightColor,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ItemTasklist(task: taskList[index],);
            },
              itemCount: taskList.length,
            ),
          ),
        ],
      ),

    );
  }

  getAllTaskFromFireStore() async {
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList = taskList.where((task) {
      DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(task.date);
      if (selectedDate.day == dateTime.month
          && selectedDate.month == dateTime.month
          && selectedDate.year == dateTime.year) {
        return true;
      }
      return false;
    }).toList();
    setState(() {

    });
  }
}
