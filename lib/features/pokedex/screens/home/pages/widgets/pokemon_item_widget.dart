import 'package:flutter/material.dart';
import 'package:pokedexflutter/features/pokedex/screens/home/pages/widgets/type_widget.dart';
import '../../../../../../common/models/pokemon.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pokemon.baseColor!.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    pokemon.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(pokemon.num),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.type
                      .map((e) => TypeWidget(
                            name: e,
                          ))
                      .toList(),
                ),
                Flexible(
                  child: Image.network(pokemon.image),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
