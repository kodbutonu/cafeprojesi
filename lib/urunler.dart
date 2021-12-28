import 'dart:convert';

import 'package:cafe/homepage.dart';
import 'package:cafe/urun_entity.dart';
import 'package:cafe/urunler_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'menu.dart';

class ScreenArguments {
  final String MenuId;
  final String MenuName;

  ScreenArguments(this.MenuId, this.MenuName);
}

class Urunler extends StatefulWidget {
  static const routeName = '/urunler';

  const Urunler({Key? key}) : super(key: key);

  @override
  UrunlerState createState() => UrunlerState();
}

class UrunlerState extends State<Urunler> {
  String kategoriAdi = "";
  String kategoriId = "";
  List menuArray = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    setState(() => kategoriId = args.MenuId);
    setState(() => kategoriAdi = args.MenuName);

    if (menuArray.length == 0) {
      http
          .get(Uri.parse(
              'http://flutter-api.fatihsari.net/resto_islemler/urunleri-getir.php?menu=$kategoriId'))
          .then((response) {
        debugPrint("xx");
        debugPrint(response.body);

        UrunlerResponse ur =
            UrunlerResponse.fromJson(jsonDecode(response.body));

        if (ur.count > 0) {
          setState(() => menuArray = ur.data);
        }
      });
    }

    int MenuLen = menuArray.length;

    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: EdgeInsets.all(15.00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 6.0,
                      spreadRadius: 4.0,
                      offset: Offset(0.0, 0.3)),
                ],
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("URUNLER",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ))),
      SizedBox(
        child: Column(
          children: List.generate(MenuLen, (index) {
            UrunEntity urun_single = menuArray[index];
            var _color = Colors.orange;

            if (index % 2 == 0) {
              _color = Colors.blue;
            }

            return Container(
                color: _color,
                padding: EdgeInsets.all(5.00),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 150,
                              height: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.network(urun_single.gorsel,
                                      height: 150,
                                      width: 150,
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.fill))),
                          Expanded(
                              child: Text(
                            urun_single.isim,
                            style: const TextStyle(
                              letterSpacing: 2,
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ))
                        ])));
          }),
        ),
      ),
      SizedBox(height: 10),
      ElevatedButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setBool("isLoggedIn", false);
            prefs.setString("userName", "");
            prefs.setString("userId", "");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text("Çıkış Yap"),
          style: ElevatedButton.styleFrom(alignment: Alignment.bottomCenter)),
      SizedBox(height: 25),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => menu()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, alignment: Alignment.bottomCenter),
              child: Text(
                "Geri Dön",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    ]));
  }
}
