import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDetail extends StatelessWidget {
  final int pokeId;
  final String pokeImageUrl;
  final String pokeName;
  final List pokeType;
  HeaderDetail(this.pokeName, this.pokeType, this.pokeId, this.pokeImageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${pokeName[0].toUpperCase() + pokeName.substring(1)}",
                    style: GoogleFonts.roboto(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...pokeType.map((e) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Chip(
                              label: Text(e["type"]["name"]),
                              backgroundColor: Colors.white,
                          ),
                        );
                      }).toList()
                    ],
                  )
                ],
              ),
              Expanded(child: Text(
                "#${pokeId.toString()}",
                textAlign: TextAlign.end,
                style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ))
            ],
          ),
          Center(child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 4,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(pokeImageUrl),
            ),
          ),)
        ],
      ),
    );
  }
}
