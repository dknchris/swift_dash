import 'package:flutter/material.dart';
import 'package:swift_dash/models/user.dart';
import 'package:swift_dash/widgets/user_tile.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList(this.users, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: users.map((e) => UserTile(e)).toList(),
    );
  }
}
