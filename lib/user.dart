import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {

  const UserWidget({
    Key key,
    @required List users,
  }) : _users = users, super(key: key);

  final List _users;

  @override
  Widget build(BuildContext context) {
    print('UserWidget.build()');
    return ListView.separated(
        itemCount: _users.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, i) => const Divider(),
        itemBuilder: (context, i) {
          final user = _users[i];
          return ListTile(
            title: Row(
                  children: <Widget>[
                    // Image.asset('assets/images/csubu-bw.png', width: 48, height: 48),
                    Padding(padding: EdgeInsets.all(4), child: CircleAvatar(backgroundImage: NetworkImage(user['avatar_url']))),
                    Expanded(child: Text(user['login']))
                  ]
                ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Repo: ${user["repos_url"]}'),
                Text('URL: ${user["url"]}')
              ]
             )
          );
        }
      );
  }
}