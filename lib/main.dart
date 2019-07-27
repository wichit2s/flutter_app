import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

void main() {

  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new CSUBUFlutterApp());

}

class CSUBUFlutterApp extends StatelessWidget {

  final appTitle = 'CSUBU App Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: AppHomePage(title: appTitle),
    );
  }

}

class AppHomePage extends StatefulWidget {

  AppHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppHomePageState createState() => _AppHomePageState();

}

class _AppHomePageState extends State<AppHomePage> {

  int _counter = 0;
  var _courses = <dynamic>[ ];


  void _incrementCounter() {
    setState(() {
      _counter++;
      _courses.add({
        'title': 'Course Title',
        'instructor': 'avatar',
        'description': 'Foundation of the course, intermediate course content, and advance topics.'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: _courses.length,
          padding: const EdgeInsets.all(8.0),
          separatorBuilder: (context, i) => const Divider(),
          itemBuilder: (context, i) {
            final course = _courses[i];
            return ListTile(
              title: Row(
                    children: <Widget>[
                      Image.asset('assets/images/csubu-bw.png', width: 48, height: 48),
                      Expanded(child: Text(course['title']))
                    ]
                  ),
              subtitle: Text(course['description'])
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
