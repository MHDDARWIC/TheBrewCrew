import 'package:cloud_firestore/cloud_firestore.dart';

//This class is going to have all the operations to interact with the database
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  //collection reference:
  final CollectionReference brewCollection=Firestore.instance.collection('brews');


  //this function is called whenever a new user signs up
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({ // Link UID with appropriate collection
      'sugars':sugars,
      'name':name,
      'strength':strength,
    });
  }

  //get brews stream (listens for changes and can be used to get up-to-date data whenever we want)
  Stream<QuerySnapshot> get brews{
    return brewCollection.snapshots();
  }




}