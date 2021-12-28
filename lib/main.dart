import 'package:cafe/homepage.dart';

import 'package:cafe/register.dart';
import 'package:cafe/urunler.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // show the dialog

    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString("userId") != null) {}
    });

    return MaterialApp(
      title: 'PİTA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Page(),
      routes: {
        Urunler.routeName: (context) => const Urunler(),
      },
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
          margin: EdgeInsets.only(top: 15.0),
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/cook.png",
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Oturum açın",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: Text(
                          "Giris Yap",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //builder: (context) => HomePage()
                                  builder: (context) => HomePage()));
                        },
                        style:
                            ElevatedButton.styleFrom(onPrimary: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        child: Text(
                          "Üye Ol",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        style:
                            ElevatedButton.styleFrom(onPrimary: Colors.black),
                      ),
                    ],
                  ),
                )
              ])),
    );
  }
}
