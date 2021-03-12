
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_825180076/data/pokedex_detail.dart';
import 'package:pokemon_825180076/data/pokedex_info_response.dart';
import 'package:pokemon_825180076/data/pokedex_repository.dart';
import 'package:pokemon_825180076/data/pokedex_species_info.dart';


class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _pokemonRepository = PokemonRepository();

  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonDetails() => emit(null);
}