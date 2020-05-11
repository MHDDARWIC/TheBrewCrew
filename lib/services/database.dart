import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thebrewcrew/models/brew.dart';
import 'package:thebrewcrew/models/user.dart';

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

  // brew list from a snapshot (READ)
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew(
        name:doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid:uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  //get brews stream (listens for changes and can be used to get up-to-date data whenever we want)
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream <UserData> get userData{
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}