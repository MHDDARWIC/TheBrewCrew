//decides based on authentication whether to show home page or sign in page
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thebrewcrew/screens/authenticate/authenticate.dart';
import 'package:thebrewcrew/screens/home/home.dart';
import 'package:thebrewcrew/models/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    print(user);
    //return either Home or Authenticate widget
    if(user==null){ // no user logged in
      return Authenticate();
    }
    else{ // user is logged in
      return Home();
    }
  }
}
