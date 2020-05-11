class User{
  // we want to extract the important properties that we want from the firebaseUser object
  final String uid;  // i want to extract the uid
  User({this.uid});
}

class UserData{
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid,this.sugars,this.strength,this.name});

}