import 'package:flutter/material.dart';
import 'package:rick_and_morty_bloc/DataLayer/Entities/character.dart';

class CharacterScreen extends StatelessWidget {
  static const String routeName = "/character";

  final Character character;
  const CharacterScreen({Key? key, required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 40, 29, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 206, 76, 1),
        title: const Text(
          "Character description",
          style: TextStyle(color: Color.fromRGBO(68, 40, 29, 1)),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(68, 40, 29, 1),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: const Color.fromRGBO(68, 40, 29, 0.4),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Card(
                        elevation: 16.0,
                        shadowColor: const Color.fromRGBO(151, 206, 76, 1),
                        clipBehavior: Clip.antiAlias,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(character.image),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        character.name,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(151, 206, 76, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Gender: ${character.gender}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Location: ${character.location}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Status: ${character.status}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
