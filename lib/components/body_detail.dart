import 'package:flutter/material.dart';
import 'package:pokedex/components/about_detail.dart';
import 'package:pokedex/components/stat_detail.dart';

class BodyDetail extends StatelessWidget {
  final Map pokeData;
  BodyDetail(this.pokeData);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: "About",),
                    Tab(text: "Base Stat",),
                  ]),
              Expanded(
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: AboutDetail(this.pokeData)
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: StatDetail(pokeData["stats"]),
                      ),
                    ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
