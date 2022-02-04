import 'package:json_annotation/json_annotation.dart';

import 'character.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  Info info;
  List<Character> results;

  CharactersResponse({required this.info, required this.results});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}

@JsonSerializable()
class Info {
  int count;
  int pages;
  String? next;
  String? prev;

  Info({required this.count, required this.pages});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
