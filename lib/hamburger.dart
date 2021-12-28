import 'package:cafe/hamburger_detail.dart';
import 'package:flutter/material.dart';

class Hamburger extends StatelessWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 40.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('Tavuk Burger', '15.0 TL', 'images/tavukburger.png',
                    false, false, context),
                _buildCard('Double Tavuk Burger', '20.0 TL',
                    'images/doubletavukburger.png', false, false, context),
                _buildCard('Ekstra Burger', '20.0 TL', 'images/eburger.png',
                    false, false, context),
                _buildCard('Et Burger', '15.0 TL', 'images/etburger.jpg', false,
                    false, context),
                _buildCard('Chicken Royale Burger', '25.0 TL',
                    'images/chicken-royaleburger.jpg', false, false, context),
                _buildCard('Whopper Ciz Burger', '25.0 TL',
                    'images/chicken-royaleburger.jpg', false, false, context)
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgpath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HamburgerDetail(
                  assetPath: imgpath,
                  hamburgerprice: price,
                  hamburgername: name,
                );
              }));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                  )
                          ])),
                  Hero(
                    tag: imgpath,
                    child: Container(
                        height: 40,
                        width: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgpath),
                                fit: BoxFit.contain))),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    price,
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (!added) ...[
                          Icon(
                            Icons.shopping_basket,
                            color: Colors.black,
                            size: 12,
                          ),
                          Text(
                            "Satin al",
                            style: TextStyle(fontSize: 12),
                          )
                        ]
                      ],
                    ),
                  )
                ]))));
  }
}
