// ignore: implementation_imports
import 'package:firebase_admin/src/auth/user_record.dart';

class User {
  User(this._userRecord);

  final UserRecord _userRecord;

  String get uid => _userRecord.uid;

  String get displayName => _userRecord.displayName!;

  String get email => _userRecord.email!;

  String get photoUrl => _userRecord.photoUrl!;
}
