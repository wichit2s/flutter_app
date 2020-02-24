import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

class AppHomePage extends StatefulWidget {

  AppHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppHomePageState createState() => _AppHomePageState();

}

class _AppHomePageState extends State<AppHomePage> {

  int _counter = 0;
  var _courses = <dynamic>[ ];
  // Future<dynamic> _students;
  var _students = [];
  var _users = [];
  var _loading = true;
  var _page = 0;

  _get_students_from_kuzzle() async {
    var url = 'https://cs.sci.ubu.ac.th:7512/topic-1/student/_search?from=${_page*10}&size=10';
    const headers = { 'Content-Type': 'application/json; charset=utf-8' };
    const query = { 'query': { 'match_all': {} } };
    final response = await http.post(url, headers: headers, body: json.encode(query));
    _students = [];
    if (response.statusCode == 200) {
      var result = jsonDecode(utf8.decode(response.bodyBytes))['result']['hits'];
      result.forEach((item) {
        if (item.containsKey('_source')) {
          var source = item['_source'];
          if (source.containsKey('name') && source.containsKey('email')) {
            _students.add(item['_source']);
          }
        }
      });
    }
    setState(() {
      _page = (_page+1)%3;
      _loading = false;
    });
  }

  _get_users_from_github() async {
    var url = 'https://api.github.com/users';
    final response = await http.get(url);
    _users = [];
    if (response.statusCode == 200) {
      var result = jsonDecode(utf8.decode(response.bodyBytes)); //['result']['hits'];
      _users = result;
    }
    setState(() {
      _page = (_page+1)%3;
      _loading = false;
    });
  }

  void _incrementCounter() {
    setState(() { _loading = true; });
    // _get_students_from_kuzzle();
    _get_users_from_github();
  }

  Widget loadingWidget(BuildContext context) {
    return Column(children: <Widget>[Text('loading....'), CircularProgressIndicator(), Text('Click the button')]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (_loading)? loadingWidget(context) : UserWidget(users: _users), // StudentWidget(students: _students),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text('$_page'), // Icon(Icons.add),
      )
    );
  }
}