import 'package:flowers/models/flowers.dart';
import 'package:flowers/screens/home/popular_flowers.dart';
import 'package:flutter/material.dart';

class FlowerDetais extends StatefulWidget {
  final Flowers obj;
  FlowerDetais({this.obj});

  @override
  _FlowerDetaisState createState() => _FlowerDetaisState();
}

class _FlowerDetaisState extends State<FlowerDetais> {
  @override
  Widget build(BuildContext context) {
    print("This is my image " + widget.obj.image);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Stack(
              children: <Widget>[
                Center(
                  child: Hero(
                      tag: "image",
                      child: Container(
                        height: 250,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(widget.obj.image)),
                      )),
                ),
                Positioned(
                    top: 5,
                    left: 235,
                    child: Container(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 20,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text("R450.00"),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(5)),
                          color: Colors.grey),
                      child: Center(
                        child: Text(
                          "Buy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Porpular Flowers",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
            ),
            PopularFlowers()
          ],
        ),
      ),
    );
  }
}
