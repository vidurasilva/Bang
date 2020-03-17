import 'package:flutter/material.dart';
import 'package:thousand_bits/configs/AppColors.dart';
import 'package:thousand_bits/src/pokedex/pokedex.dart';
import 'package:thousand_bits/src/pokemon_info/pokemon_info.dart';
import 'package:thousand_bits/splash.dart';
import 'package:thousand_bits/widgets/fade_page_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Free Bits',
      theme: ThemeData(
        fontFamily: 'CircularStd',
        textTheme:
            Theme.of(context).textTheme.apply(displayColor: AppColors.black),
        scaffoldBackgroundColor: AppColors.lightGrey,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _getRoute,
    );
  }

  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return FadeRoute(page: splashscreen());

      case '/pokedex':
        return FadeRoute(page: Pokedex());

      case '/pokemon-info':
        return FadeRoute(page: PokemonInfo());

      default:
        return null;
    }
  }
}
