import 'dart:convert';

import 'package:cafe/bottom_bar.dart';

import 'package:cafe/urunler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Meenu.dart';

class menu extends StatefulWidget {
  @override
  menuState createState() => menuState();
}

String userName = "";
List menuArray = [];

class menuState extends State<menu> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => userName = prefs.getString("userName")!);
    });
    if (menuArray.length == 0) {
      http
          .get(Uri.parse(
              'http://flutter-api.fatihsari.net/resto_islemler/menuler-getir.php'))
          .then((response) {
        MenuResponse mr = MenuResponse.fromJson(jsonDecode(response.body));

        if (mr.count > 0) {
          setState(() => menuArray = mr.data);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.fastfood,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Ne almak istersin?",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 1,
        children: menuArray
            .map((item) => ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Urunler.routeName,
                      arguments: ScreenArguments(item.id, item.isim));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          color: Colors.white,
                          height: 140,
                          width: 140,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(160),
                              child: Image.network(
                                item.gorsel,
                                alignment: Alignment.centerLeft,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ))),
                      Expanded(
                          child: Text(
                        item.isim,
                        style: const TextStyle(
                          letterSpacing: 2,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ))
                    ])))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFFF17532),
          child: Icon(Icons.fastfood)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomBar(),
    );
  }
}
