import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/pokemon_item.dart';
import 'package:pokedex/providers/GetPokemonProviders.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  void initState() {
    // Provider.of<GetPokemonProviders>(context, listen: false).getPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetPokemonProviders>(
      create: (context) => GetPokemonProviders(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text("Pokedex", style: TextStyle(color: Colors.black),),
          ),
        ),
        body: Container(
          child: Consumer<GetPokemonProviders>(builder: (context, value, child) {
            return value.isLoading ? Center(
              child: CircularProgressIndicator(),
            ) : value.pokemonList?.length == 0 ? Center(
              child: Text("No Pokemon"),
            ) : SmartRefresher(
                enablePullUp: true,
                enablePullDown: false,
                controller: _refreshController,
                footer: ClassicFooter(),
                onLoading: () => value.loadMoreItem(_refreshController),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2/2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                    ),
                    itemCount: value.pokemonList?.length,
                    itemBuilder: (context, index) {
                      return PokemonItem(value.pokemonList?[index]);
                    })
            );
          }),
        ),
      ),
    );
  }
}
