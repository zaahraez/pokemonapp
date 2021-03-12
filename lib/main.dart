import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_825180076/app_nav.dart';
import 'package:pokemon_825180076/bloc/nav_cubit.dart';
import 'package:pokemon_825180076/bloc/pokedex_bloc.dart';
import 'package:pokemon_825180076/bloc/pokedex_details_cubit.dart';
import 'package:pokemon_825180076/bloc/pokedex_event.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.pink, accentColor: Colors.pinkAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
            PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(
            create: (context) =>
                NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
        BlocProvider(create: (context) => pokemonDetailsCubit)
      ], child: AppNavigator()),
    );
  }
}