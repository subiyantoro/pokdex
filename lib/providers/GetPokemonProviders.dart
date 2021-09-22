import 'package:flutter/cupertino.dart';
import 'package:pokedex/service/ApiService.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GetPokemonProviders extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List _pokemonList = [];
  int _limit = 10;
  int _offset = 0;
  bool _isError = false;
  int _totalPoke = 0;
  bool _isLoading = false;

  List? get pokemonList => _pokemonList;
  bool get isError => _isError;
  int get totalPoke => _totalPoke;
  bool get isLoading => _isLoading;
  int get limit => limit;

  _getSinglePokemonInfo(Map pokemon) {
    apiService.baseInit("pokemon/${pokemon['name']}").then((value) {
      _pokemonList.add(value);
      notifyListeners();
    });
  }

  getPokemonList() {
    _isLoading = true;
    if (_pokemonList.length > 0) {
      _offset = _limit;
      _limit = _limit + 20;

      apiService.baseInit("pokemon?limit=$_limit&offset=$_offset")
        .then((value) {
          _totalPoke = value["count"];
          value["results"].forEach((element) {
            _getSinglePokemonInfo(element);
          });
          _isLoading = false;
          notifyListeners();
        }).onError((error, stackTrace){
          _isError = true;
          notifyListeners();
        });
    } else {
      apiService.baseInit("pokemon?limit=$_limit&offset=$_offset")
        .then((value) {
          _totalPoke = value["count"];
          value["results"].forEach((element) {
            _getSinglePokemonInfo(element);
          });
          _isLoading = false;
          notifyListeners();
        }).onError((error, stackTrace){
          _isError = true;
          notifyListeners();
        });
    }
    notifyListeners();
  }

  loadMoreItem(RefreshController refreshController) async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    getPokemonList();
    refreshController.loadComplete();
  }

  GetPokemonProviders() {
    getPokemonList();
  }
}
