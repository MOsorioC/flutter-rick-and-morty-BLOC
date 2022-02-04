import 'dart:async';

import 'bloc.dart';
import '../DataLayer/Entities/character.dart';

class CharacterBloc implements Bloc {
  Character? _character;
  Character? get character => _character;

  final _characterController = StreamController<Character>();

  Stream<Character> get characterStream => _characterController.stream;

  void selectCharacter(Character character) {
    _character = _character;
    _characterController.sink.add(character);
  }

  @override
  void dispose() {
    _characterController.close();
  }

}