import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase/task_modle.dart';
import 'package:untitled1/firebase/user_modle.dart';

class FirebaseFunction {
  static CollectionReference<TaskModle> getCollectionTask() {
    return FirebaseFirestore.instance
        .collection('task')
        .withConverter<TaskModle>(
      fromFirestore: (snapshot, _) {
        return TaskModle.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJason();
      },
    );
  }
///add
  static Future<void> addTask(TaskModle taskModle) {
    var collection = getCollectionTask();
    var docRef = collection.doc();
    taskModle.id = docRef.id;
    return docRef.set(taskModle);
  }
///get
  static Stream<QuerySnapshot<TaskModle>> getTasks(DateTime data) {
    return getCollectionTask()
        .where('userId',isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(
          "data",
          isEqualTo: DateUtils.dateOnly(data).millisecondsSinceEpoch,
        )
        .snapshots();
  }
///delete
  static Future<void> deleteTask(String id) {
    return getCollectionTask().doc(id).delete();
  }
///up date
  static Future<void> updateTask(TaskModle taskModle)async {
   await getCollectionTask().doc(taskModle.id).update(taskModle.toJason());
  }


  ///auth functions

  static CollectionReference<UserModle> getUserCollection() {
    return FirebaseFirestore.instance
        .collection('user')
        .withConverter<UserModle>(
      fromFirestore: (snapshot, _) {
        return UserModle.fromJason(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

  static Future<UserModle?>  readUser()async{
    String id =FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<UserModle>documentSnapshot=
   await getUserCollection().doc(id).get();
    return documentSnapshot.data();
  }

  static Future<void> addUser(UserModle user) {
    var collection = getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static creatUaerAccount({required String Email,
    required String Password,
    required String userName,
    required Function onSuccess,
    required Function onError}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      UserModle user = UserModle(
          id: credential.user?.uid ?? '',
          userName: userName,
          email: Email ?? '');
      await addUser(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        onError(e.message);
      }
      onError(e.message);
    } catch (e) {
      print('something went wrong');
    }
  }

  static login(String Email,
      String Password,
      Function onSuccess,
      Function onErorr) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      onSuccess();

    } on FirebaseAuthException catch (e) {
      onErorr(e.message);
     // if (e.code == 'user-not-found') {
       // print('No user found for that email.');
      //} else if (e.code == 'wrong-password') {
       // print('Wrong password provided for that user.');
    //  }
    }
  }

  static void logOut()async{
    await FirebaseAuth.instance.signOut();
  }
}
