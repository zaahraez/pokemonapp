
import 'package:flutter/material.dart';
import 'package:pokemon_825180076/data/pokedex_page_response.dart';



abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {@required this.pokemonListings, @required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({@required this.error});
}