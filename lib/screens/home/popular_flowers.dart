import 'package:flutter/material.dart';

class PopularFlowers extends StatefulWidget {
  @override
  _PopularFlowersState createState() => _PopularFlowersState();
}

class _PopularFlowersState extends State<PopularFlowers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 90,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
            );
          }),
    );
  }
}
