import 'package:flutter/material.dart';
import 'package:pokedexflutter/common/errors/failure.dart';
import 'package:pokedexflutter/common/models/pokemon.dart';
import 'package:pokedexflutter/common/repositories/pokemon_repository.dart';
import 'package:pokedexflutter/common/widgets/po_error.dart';
import 'package:pokedexflutter/common/widgets/po_loading.dart';
import 'package:pokedexflutter/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({required this.pokemon});
  final Pokemon pokemon;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key, required this.repository, required this.arguments}) : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return DetailPage(pokemon: arguments.pokemon, list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
