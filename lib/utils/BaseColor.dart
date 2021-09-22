
import 'package:flutter/cupertino.dart';

class BaseColor {
  final String type;
  BaseColor(this.type);

  getColor() {
    switch(this.type) {
      case "normal": {
        return Color(0xFFA7A877);
      }
      case "fire": {
        return Color(0xFFF08030);
      }
      case "water": {
        return Color(0xFF6790F0);
      }
      case "grass": {
        return Color(0xFF78C84F);
      }
      case "ice": {
        return Color(0xFF99D7D8);
      }
      case "electric": {
        return Color(0xFFF9CF30);
      }
      case "fighting": {
        return Color(0xFFC13128);
      }
      case "poison": {
        return Color(0xFF9F409F);
      }
      case "ground": {
        return Color(0xFFDFC06E);
      }
      case "flying": {
        return Color(0xFFA890F0);
      }
      case "psychic": {
        return Color(0xFFF95887);
      }
      case "bug": {
        return Color(0xFFA9B720);
      }
      case "rock": {
        return Color(0xFFB8A038);
      }
      case "ghost": {
        return Color(0xFF705898);
      }
      case "dark": {
        return Color(0xFF6F5848);
      }
      case "dragon": {
        return Color(0xFF7138F8);
      }
      case "steel": {
        return Color(0xFFB8B8D0);
      }
      case "fairy": {
        return Color(0xFFEFB5BC);
      }
      default: {
        return Color(0xFFB8B8B8);
      }
    }
  }
}
