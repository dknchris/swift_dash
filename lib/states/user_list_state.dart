import 'package:swift_dash/models/user.dart';

abstract class UserListState {
  factory UserListState.success(List<User> users) = UserListSuccess;

  factory UserListState.failure(String error) = UserListFailure;

  factory UserListState.waiting() = UserListWaiting;
}

class UserListSuccess implements UserListState {
  final List<User> users;

  UserListSuccess(this.users);
}

class UserListFailure implements UserListState {
  String error;

  UserListFailure(this.error);
}

class UserListWaiting implements UserListState {}
