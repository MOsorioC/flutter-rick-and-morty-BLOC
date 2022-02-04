import 'package:flutter/material.dart';

import 'BLoC/bloc_provider.dart';
import 'router.dart';
import 'ui/characters_screen.dart';
import 'BLoC/character_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
      bloc: CharacterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: CharactersScreen.routeName,
        onGenerateRoute: Routing.generateRoute,
      ),
    );
  }
}
