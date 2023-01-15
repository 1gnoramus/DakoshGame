// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:dakosh/data/storyline100.dart';
import 'package:dakosh/flame_layer/dakosha_game.dart';
import 'package:dakosh/models/dialogue.dart';
import 'package:flame/components.dart';

class DialogueComponent extends PositionComponent with HasGameRef<DakoshaGame> {
  Dialogue dialogue = storyline100Dialogue[0];

  SpriteComponent characterComponent = SpriteComponent();
  SpriteComponent secondaryCharacterComponent = SpriteComponent();
  SpriteComponent backgroundScene = SpriteComponent();

  bool characterFlipped = false;

  late Sprite dakoshaSprite;
  late Sprite madiSprite;
  late Sprite street;
  late Vector2 characterSize;
  late Vector2 secondaryCharacteSize;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    backgroundScene
      ..sprite = await gameRef.loadSprite('bgs/Street.png')
      ..size = gameRef.size;
    add(backgroundScene);

    characterSize = Vector2(gameRef.size.x * .25, gameRef.size.y * .55);
    secondaryCharacteSize = Vector2(gameRef.size.x * .15, gameRef.size.y * .35);

    dakoshaSprite = await gameRef.loadSprite('characters/DakoshaSmile.webp');
    madiSprite = await gameRef.loadSprite('characters/MadiSmile.webp');

    characterComponent
      ..size = characterSize
      ..sprite = dakoshaSprite
      ..position = Vector2(25, gameRef.size.y * .15);
    add(characterComponent);

    secondaryCharacterComponent
      ..size = secondaryCharacteSize
      ..sprite = madiSprite
      ..position = Vector2(gameRef.size.x * .75, gameRef.size.y * .35);
    add(secondaryCharacterComponent);
  }

  @override
  void update(double dt) {
    dialogue = storyline100Dialogue[gameRef.dialogId - 101];
    if (characterComponent.x < gameRef.size.x / 3) {
      characterComponent.x += 100 * dt;
    } else if (!characterFlipped) {
      characterComponent.flipHorizontallyAroundCenter();
      characterFlipped = true;
    }

    switch (dialogue.characterName) {
      case CharacterName.dakosha:
        characterComponent.sprite = dakoshaSprite;
        secondaryCharacterComponent.sprite = madiSprite;
        break;

      case CharacterName.madi:
        characterComponent.sprite = madiSprite;
        secondaryCharacterComponent.sprite = dakoshaSprite;
        break;
    }
    super.update(dt);
  }
}
