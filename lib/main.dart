import 'package:flutter/material.dart';
import 'package:pokedex/pages/main_page.dart';
import 'package:pokedex/pages/pokemon_detail.dart';
import 'package:pokedex/pages/splash_screen.dart';
import 'package:pokedex/providers/GetPokemonProviders.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => GetPokemonProviders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/': (ctx) => MainPage(),
          '/splash': (ctx) => SplashScreen()
        },
      ),
    );
  }
}
