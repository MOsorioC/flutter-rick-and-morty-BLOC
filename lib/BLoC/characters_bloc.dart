import 'dart:async';
import 'package:dio/dio.dart';

import 'package:rick_and_morty_bloc/DataLayer/Client/rick_and_morty_client.dart';
import '../DataLayer/Entities/character.dart';
import 'bloc.dart';


class CharactersBloc extends Bloc {
  final _controller = StreamController<List<Character>>();
  final _client = RickAndMortyClient(Dio());
  Stream<List<Character>> get charactersStream => _controller.stream;

  Future<void> getCharacters() async {
    final results = await _client.getCharacters();
    _controller.sink.add(results.results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}