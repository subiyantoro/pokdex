import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://pokeapi.co/api/v2/";
  Future baseInit(String path) async {
    final apiUrl = Uri.parse(baseUrl + path);
    final responseBody = await http.get(apiUrl);
    final decodeResponse = jsonDecode(responseBody.body);

    return decodeResponse;
  }
}
