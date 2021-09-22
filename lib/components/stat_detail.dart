import 'package:flutter/material.dart';

class StatDetail extends StatelessWidget {
  final List pokeStat;
  StatDetail(this.pokeStat);

  _renderColor(int value) {
    if (value < 100 && value >= 60) {
      return Colors.blueAccent;
    } else if (value < 60 && value >= 40) {
      return Colors.orangeAccent;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ...pokeStat.map((e) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Expanded(child: Text(e["stat"]["name"].toString().toUpperCase()), flex: 2,),
                  Expanded(child: Text(e["base_stat"].toString()), flex: 1),
                  Expanded(child: LinearProgressIndicator(
                    value: e["base_stat"] / 100,
                    color: _renderColor(e["base_stat"]),
                  ), flex: 3,)
                ],
              ),
            );
          })
        ]
      ),
    );
  }
}
