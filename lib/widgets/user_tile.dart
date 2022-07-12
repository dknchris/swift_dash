import 'package:flutter/material.dart';
import 'package:swift_dash/models/user.dart';

class UserTile extends StatelessWidget {
  const UserTile(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey,
              foregroundImage: NetworkImage(user.photoUrl),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                width: 256.0,
                height: 72.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      user.email,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      user.uid,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
