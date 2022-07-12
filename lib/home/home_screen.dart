import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_dash/firebase/firebase_helper.dart';
import 'package:swift_dash/providers/user_list_provider.dart';
import 'package:swift_dash/states/user_list_state.dart';

import '../providers/theme_provider.dart';
import '../widgets/user_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> fetchInitialData() async {
    var userListProvider = UserListProvider.get(context);
    var users = await FireHelper.listUsers();
    userListProvider.state = UserListState.success(users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          GestureDetector(
            child: SizedBox(
              height: 64.0,
              width: 64.0,
              child: Icon(ThemeProvider.getListener(context).isLightTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
            ),
            onTap: () => ThemeProvider.get(context).toggleTheme(),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => UserListProvider(),
        builder: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.search), hintText: 'Search users'),
                    onSubmitted: (text) async {
                      var provider = UserListProvider.get(context);
                      var user = await FireHelper.searchUser(text.trim());
                      provider.state = UserListState.success([user]);
                    },
                  ),
                ),
                renderUserListState(
                    UserListProvider.getListener(context).state),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderUserListState(UserListState state) {
    if (state is UserListSuccess) {
      var users = state.users;
      return users.isNotEmpty ? UserList(users) : const Text('No user found!');
    } else if (state is UserListFailure) {
      return Text('Error: ${state.error}');
    } else {
      return const Text('Waiting for search or some action...');
    }
  }
}
