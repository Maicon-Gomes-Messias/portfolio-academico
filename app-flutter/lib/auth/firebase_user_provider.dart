import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyGardenAPPFirebaseUser {
  MyGardenAPPFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

MyGardenAPPFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyGardenAPPFirebaseUser> myGardenAPPFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MyGardenAPPFirebaseUser>(
        (user) => currentUser = MyGardenAPPFirebaseUser(user));
