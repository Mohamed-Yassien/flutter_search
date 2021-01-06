import 'package:flutter/material.dart';
import 'package:flutter_search_1/user_api.dart';
import 'package:flutter_search_1/user_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> users = [];
  List<UserModel> queryUsers = [];

  @override
  void initState() {
    UserApi.fetchUsers().then(
      (value) => setState(
        () {
          users.addAll(value);
          queryUsers = users;
          print(users);
          print(queryUsers);
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => index == 0
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(hintText: 'Search here....'),
                    onChanged: (val) {
                      val.toLowerCase();
                      setState(() {
                        users = queryUsers.where((element) {
                          var userName = element.name.toLowerCase();
                          return userName.contains(val);
                        }).toList();
                      });
                    },
                  ),
              )
              : Card(
            elevation: 4,
                child: ListTile(
                    title: Text(users[index - 1].name),
                    subtitle: Text(users[index - 1].email),
                  ),
              ),
          itemCount: users.length + 1,
        ),
      ),
    );
  }
}
