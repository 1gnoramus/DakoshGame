enum CharacterName { dakosha, madi }

enum Location { street, bus, dakoshRoom, madiRoom }

class Dialogue {
  final CharacterName characterName;
  final Location location;
  final String text;
  Dialogue(
      {required this.location,
      required this.characterName,
      required this.text});
}
