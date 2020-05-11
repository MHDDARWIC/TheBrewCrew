import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thebrewcrew/services/auth.dart';
import 'package:thebrewcrew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:thebrewcrew/screens/home/brew_list.dart';
import 'package:thebrewcrew/models/brew.dart';
import 'package:thebrewcrew/screens/home/settings_form.dart';


class Home extends StatelessWidget {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews, // get stream
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text("Logout"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text("Settings"),
              onPressed: () => _showSettingsPanel(),

            ),

          ],
        ),

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BrewList(),
        ),

      ),
    );
  }
}
