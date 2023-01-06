import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/model/task.dart';

 CollectionReference<Task> getTaskCollection(){
   return FirebaseFirestore.instance.collection('todo').withConverter<Task>(
      fromFirestore:((snapshot,options)=>Task.fromJson(snapshot.data()!)) ,
      toFirestore: (task,options)=> task.toJason());
}
Future<void> addTaskToFireStore(Task task){
 var collection = getTaskCollection();
  var docRef =collection.doc();
  task.id = docRef.id;
  return docRef.set(task);

}