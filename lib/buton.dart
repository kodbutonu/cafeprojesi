import 'package:cafe/sepet.dart';
import 'package:flutter/material.dart';

class Buton extends StatelessWidget {
  const Buton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.orange,
        width: MediaQuery.of(context).size.width - 50,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => sepet()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.orange, onPrimary: Colors.black),
            child: Text(
              'Sepete ekle',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ),
    );
  }
}
