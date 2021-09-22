import 'package:flutter/material.dart';

class AboutDetail extends StatelessWidget {
  final Map pokeData;
  AboutDetail(this.pokeData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(child: Text("Species"), flex: 1,),
                Expanded(child: Text(this.pokeData["species"]["name"], style: TextStyle(fontWeight: FontWeight.w500),), flex: 2,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(child: Text("Height"), flex: 1,),
                Expanded(child: Text("${this.pokeData["height"]} inch", style: TextStyle(fontWeight: FontWeight.w500),), flex: 2,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(child: Text("Weight"), flex: 1,),
                Expanded(child: Text("${this.pokeData["weight"]} lbs", style: TextStyle(fontWeight: FontWeight.w500),), flex: 2,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(child: Text("Abilities"), flex: 1,),
                Expanded(child: Row(
                  children: [
                    ...pokeData["abilities"].map((e) {
                      return Text("${e["ability"]["name"]}, ");
                    })
                  ],
                ), flex: 2,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
