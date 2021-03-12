
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_825180076/bloc/pokedex_bloc.dart';
import 'package:pokemon_825180076/bloc/pokedex_state.dart';

import 'bloc/nav_cubit.dart';


class PokedexView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex - 825180076'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.pokemonListings.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => BlocProvider.of<NavCubit>(context)
                      .showPokemonDetails(state.pokemonListings[index].id),
                  child: Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListings[index].imageUrl),
                          Text(state.pokemonListings[index].name)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}