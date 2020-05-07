import 'package:firebase_auth/firebase_auth.dart';
import 'package:thebrewcrew/models/user.dart';

class AuthService{ // define all of the different methods that are going to interact with firebase auth service
  final FirebaseAuth _auth=FirebaseAuth.instance; // create an instance of firebase auth

  //create user object based on FireabseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid:user.uid) : null;
  }

  //listen for auth changes using streams
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async{
    try{
      AuthResult result=await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }




  //sign in with email and password


  //register with email and password


  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }


}