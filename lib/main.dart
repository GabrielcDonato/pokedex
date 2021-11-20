import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedexflutter/common/repositories/pokemon_repository.dart';

import 'features/home/container/home_container.dart';

// entre () sao parametros
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
