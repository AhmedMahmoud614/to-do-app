import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/theme.dart';

class ItemTasklist extends StatelessWidget {
Task task;
ItemTasklist({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: MyThemeData.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: MyThemeData.primaryLightColor,
            height: 60,
            width: 4,
          ),
          Column(
            children: [
              Text(task.title,
                style: Theme.of(context).primaryTextTheme.headline2,),
              Text(task.description,
                style: Theme.of(context).primaryTextTheme.subtitle2,)
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 21),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyThemeData.primaryLightColor,
            ),
            child:Icon(Icons.check,size: 30,
            color: MyThemeData.whiteColor,),
          ),



        ],
      ),
    );
  }
}
