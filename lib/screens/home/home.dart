import 'package:flowers/screens/home/popular_flowers.dart';
import 'package:flowers/screens/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flowers/screens/home/flower_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Database().flowerStream,
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 221, 229, 227),
          body: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.menu),
                      ),
                      Container(
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 165, 173, 171),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 35,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 139, 186, 179),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                        );
                      }),
                ),
                MyFlowers(),
                SizedBox(height: 10),
                Text("Porpular Flowers",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                PopularFlowers()
              ],
            ),
          )),
    );
  }
}
