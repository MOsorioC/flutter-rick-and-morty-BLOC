import 'package:flutter/material.dart';
import 'package:rick_and_morty_bloc/BLoC/characters_bloc.dart';
import '../BLoC/bloc_provider.dart';
import '../BLoC/character_bloc.dart';
import '../DataLayer/Entities/character.dart';
import 'character_screen.dart';

class CharactersScreen extends StatelessWidget {
  static const String routeName = "/";

  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Character>(
        stream: BlocProvider.of<CharacterBloc>(context).characterStream,
        builder: (context, snapshot) {
          final character = snapshot.data;

          if (character == null) {
            return const _CharactersScreen();
          }

          return Container(
            color: Colors.white,
          );
        });
  }
}

class _CharactersScreen extends StatelessWidget {
  final bool isFullScreenDialog;

  const _CharactersScreen({Key? key, this.isFullScreenDialog = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CharactersBloc();
    return BlocProvider(
      bloc: bloc,
      child: FutureBuilder(
        future: Future.wait([bloc.getCharacters()]),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Rick and Morty',
                ),
              ),
              body: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a character',
                      ),
                      onChanged: (query) {},
                    ),
                  ),
                  Expanded(
                    child: _buildResults(bloc),
                  ),
                ],
              ),
            );
          } else {
            return Container(color: Colors.white,);
          }
        },
      ),
    );
  }

  Widget _buildResults(CharactersBloc bloc) {
    return StreamBuilder<List<Character>>(
      stream: bloc.charactersStream,
      builder: (context, snapshot) {

        // 1
        final results = snapshot.data;

        if (results == null) {
          return const Center(child: Text('Enter a character'));
        }

        if (results.isEmpty) {
          return const Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Character> results) {
    // 2
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (context, index) {
        final character = results[index];
        return ListTile(
          title: Text(character.name),
          onTap: () {
            //final characterBloc = BlocProvider.of<CharacterBloc>(context);
            //characterBloc.selectCharacter(character);

            Navigator.pushNamed(context, CharacterScreen.routeName, arguments: character);
          },
        );
      },
    );
  }
}
