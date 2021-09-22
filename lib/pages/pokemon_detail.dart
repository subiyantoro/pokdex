import 'package:flutter/material.dart';
import 'package:pokedex/components/body_detail.dart';
import 'package:pokedex/components/header_detail.dart';
import 'package:pokedex/utils/BaseColor.dart';

class PokemonDetail extends StatelessWidget {
  final Map data;
  PokemonDetail(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColor(data["types"][0]["type"]["name"]).getColor(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 30),
                  child: HeaderDetail(
                      data["name"],
                      data["types"],
                      data["id"],
                      data["sprites"]["other"]["official-artwork"]["front_default"]
                  ),
            )),
            Expanded(
              flex: 1,
              child: BodyDetail(this.data))
          ],
        ),
      ),
    );
  }
}
