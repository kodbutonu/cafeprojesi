import 'package:cafe/buton.dart';
import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class TastyDetail extends StatelessWidget {
  final assetPath, tatliprice, tatliname;

  TastyDetail({this.assetPath, this.tatliprice, this.tatliname});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Tatlilar',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 42),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Hero(
            tag: assetPath,
            child: Image.asset(
              assetPath,
              height: 150.0,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(child: Buton()),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            '$tatliprice',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 20),
          Center(
            child: Text(
              '$tatliname',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
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
