import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/Auth.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  LandingPage({@required this.auth});

//  @override
//  _LandingPageState createState() => _LandingPageState();
//}
//
//class _LandingPageState extends State<LandingPage> {
  // TODO: No longer needed due to StreamBuilder
//  User _user;
//
//  @override
//  void initState() {
//    super.initState();
//    _checkCurrentUser();
//    widget.auth.onAuthStateChanged.listen((user) {
//      print('from stream user: ${user?.uid}');
//    });
//  }

//  Future<void> _checkCurrentUser() async {
//    User user = await widget.auth.currentUser();
//    _updateUser(user);
//  }

//  void _updateUser(User user) {
////    print('User id: ${user.uid}');
//    setState(() {
//      _user = user;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
//        stream: widget.auth.onAuthStateChanged,
        stream: auth.onAuthStateChanged,
//      initialData: ,
        builder: (context, snapshot) {
          // snapshot.connectionState
          //snapshot.hasError
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage(
                auth: auth,
                //onSignIn: _updateUser,
              );
            }
            return HomePage(
              auth: auth,
              //onSignOut: () => _updateUser(null),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
