import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/Auth.dart';

class HomePage extends StatelessWidget {
  //final VoidCallback onSignOut;
  final AuthBase auth;

  const HomePage({
    //@required this.onSignOut,
    @required this.auth,
  });

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      //onSignOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
