import 'package:flutter/material.dart';

class StudentWidget extends StatelessWidget {

  const StudentWidget({
    Key key,
    @required List students,
  }) : _students = students, super(key: key);

  final List _students;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _students.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, i) => const Divider(),
        itemBuilder: (context, i) {
          final student = _students[i];
          var sum = 0;
          student['email'].runes.forEach((c) { sum += c; });
          return ListTile(
            title: Row(
                  children: <Widget>[
                    // Image.asset('assets/images/csubu-bw.png', width: 48, height: 48),
                    CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/id/${sum%30}/48/48')),
                    Expanded(child: Text(student["name"]))
                  ]
                ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Age: ${student["age"]}'),
                Text('Email: ${student["email"]}')
              ]
             )
          );
        }
      );
  }
}