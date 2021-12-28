import 'package:flutter/material.dart';

import 'bottom_bar.dart';
import 'buton.dart';

class HamburgerDetail extends StatelessWidget {
  final assetPath, hamburgerprice, hamburgername;

  HamburgerDetail({this.assetPath, this.hamburgerprice, this.hamburgername});

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
              'Hamburger',
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
            '$hamburgerprice',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 20),
          Center(
            child: Text(
              '$hamburgername',
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
