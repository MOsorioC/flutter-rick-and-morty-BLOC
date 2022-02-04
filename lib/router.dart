import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ui/character_screen.dart';
import 'ui/characters_screen.dart';
import 'DataLayer/Entities/character.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactersScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CharactersScreen(),
        );
      case CharacterScreen.routeName:
        var character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterScreen(
            character: character,
          ),
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
