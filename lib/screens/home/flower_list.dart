import 'package:flowers/models/flowers.dart';
import 'package:flowers/screens/home/flower_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFlowers extends StatefulWidget {
  @override
  _MyFlowersState createState() => _MyFlowersState();
}

class _MyFlowersState extends State<MyFlowers> {
  @override
  Widget build(BuildContext context) {
    final flowers = Provider.of<List<Flowers>>(context) ?? [];

    for (var item in flowers) {
      print(item.image);
    }

    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: flowers.length,
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FlowerDetais(obj:flowers[index])
                    ));
                  },
                  child: Hero(
                    tag: "image",
                    child: Container(
                      height: 180,
                      // width: 150,
                      margin: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          flowers[index].image,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    child: Text(
                      "Flower",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 149,
                  left: 88,
                  child: Container(
                    height: 25,
                    width: 50,
                    child: Center(
                      child: Text(
                        "View",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 172, 215, 238),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                )
              ],
            );
          }),
    );
  }
}
