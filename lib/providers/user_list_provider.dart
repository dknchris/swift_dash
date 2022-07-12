import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/user_list_state.dart';

class UserListProvider extends ChangeNotifier {
  static UserListProvider get(BuildContext context) =>
      Provider.of<UserListProvider>(context, listen: false);

  static UserListProvider getListener(BuildContext context) =>
      Provider.of<UserListProvider>(context, listen: true);

  var _state = UserListState.waiting();

  UserListState get state => _state;

  set state(state) {
    _state = state;
    notifyListeners();
  }
}
