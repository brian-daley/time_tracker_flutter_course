import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/home/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/database.dart';

class LandingPage extends StatelessWidget {
//  LandingPage({@required this.auth});
//  final AuthBase auth;
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
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return Provider<User>.value(
              value: user,
              child: Provider<Database>(
                create: (_) => FirestoreDatabase(uid: user.uid),
                child: HomePage(),
              ),
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
