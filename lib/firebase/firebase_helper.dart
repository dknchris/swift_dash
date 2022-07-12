import 'package:firebase_admin/firebase_admin.dart';
import 'package:swift_dash/firebase/firebase_setup.dart';
import 'package:swift_dash/models/user.dart';

class FireHelper {
  static Future<App> get firebaseApp async {
    await FirebaseSetup.init();
    return FirebaseSetup.app;
  }

  static Future<User> searchUser(String email) async {
    var app = await firebaseApp;
    var userRecord = await app.auth().getUserByEmail(email);
    return User(userRecord);
  }

  static Future<List<User>> listUsers() async {
    var app = await firebaseApp;
    var users = await app.auth().listUsers(10);
    return users.users.map((e) => User(e)).toList();
  }
}
