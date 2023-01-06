import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/model/fire_basew_util.dart';
import '../../model/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

  class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
String title ='';

String description ='';

var formkey = GlobalKey<FormState>();
DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.add_new_task,
          style: Theme.of(context).primaryTextTheme.subtitle1,
          textAlign:TextAlign.center ,),
          Form(
            key: formkey,
              child: Column(
            children: [
              TextFormField(

                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enter_task_title
                ),
                onChanged: (text){
                  title = text;
                },
                validator: (text){
                  if(text==null || text.isEmpty){
                    return AppLocalizations.of(context)!.add_new_task;
                  }
                  return null;
                },
              ),
              SizedBox(height: 18,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enter_task_description,
                ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return AppLocalizations.of(context)!.enter_task_description;
                    }
                    return null;
                  },

             onChanged: (text){
                  description =text;
             },
             minLines: 4,
              maxLines: 4,),

            ],
          )),
          SizedBox(height: 18,),
          Text(AppLocalizations.of(context)!.select_time,
            style: Theme.of(context).primaryTextTheme.subtitle1,),
          InkWell(
            onTap: (){
              chooseDate();

              //showcalender
            },
            child: Text("${selectedDate.month}/${selectedDate.day}/${selectedDate.year}",

              textAlign:TextAlign.center,
            style: Theme.of(context).primaryTextTheme.subtitle2,)
          ),

          SizedBox(height: 18,),
          ElevatedButton(onPressed: (){
            addTask();
          }, child: Text(AppLocalizations.of(context)!.add,
          style: Theme.of(context).primaryTextTheme.headline1,))

        ],
      ),
    );
  }

  void chooseDate() async{
  var chosenDate =   await showDatePicker(
context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
  if(chosenDate != null){
    selectedDate = chosenDate;
    setState(() {

    });
  }
  }

  void addTask() {
    if(formkey.currentState?.validate()==true){
       Task task = Task(

         title: title ,
         description: description ,
         date: selectedDate.microsecondsSinceEpoch,
       );
       addTaskToFireStore(task).timeout(Duration(microseconds: 500),
       onTimeout: (){
         print('task was added succesfully');
         Navigator.pop(context);
       });
    }
  }
}

