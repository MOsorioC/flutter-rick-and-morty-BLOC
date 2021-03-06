import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key? key, required this.bloc, required this.child}) : super(key: key);

  static Type _providerType<T>() => T;

  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider!.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  // 4
  @override
  Widget build(BuildContext context) => widget.child;

  // 5
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}