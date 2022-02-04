import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../Entities/characters_response.dart';

part 'rick_and_morty_client.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
abstract class RickAndMortyClient {
  factory RickAndMortyClient(Dio dio, {String baseUrl}) = _RickAndMortyClient;

  @GET('character')
  Future<CharactersResponse> getCharacters();
}