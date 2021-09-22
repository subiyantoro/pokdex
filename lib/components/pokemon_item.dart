import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/pages/pokemon_detail.dart';

class PokemonItem extends StatelessWidget {
  PokemonItem(this.pokedata);

  final Map pokedata;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetail(pokedata)));
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.width / 5,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.network(pokedata["sprites"]["other"]["official-artwork"]["front_default"]),
                ),
              ),
              Text(
                pokedata["name"],
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
