import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'home.dart';

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
        primarySwatch: Colors.blueGrey,
        //fontFamily: 'Roboto'
      ),
      initialRoute: 'login',
      routes: {
            'login': (context) => FlutterLogin(
              logo: 'assets/images/csubu-bw.png',
              onLogin: (LoginData data) {
                print('onLogin()');
                print('name: ${data.name}');
                print('password: ${data.password}');
                if ("admin@ubu.ac.th" == data.name && "1234" == data.password) {
                  Navigator.pushNamed(context, 'home');
                }
              },
              onRecoverPassword: (String password) {
                print('onRecoverPassword');
                print(password);
              },
              onSignup: (LoginData data) {
                print('onSignup()');
                print(data);
              },
          ),
          'home': (context) => AppHomePage(title: appTitle),
        }
    );
  }

}
