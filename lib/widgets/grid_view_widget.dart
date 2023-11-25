import 'package:flutter/material.dart';
import 'package:rick_morty_app/data/models/charecter_model.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.character,
  });
  final MyCharacter character;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(character.image ?? ''),
        ),
        const SizedBox(height: 18),
        Text(
          textAlign: TextAlign.center,
          character.status ?? '',
          style: TextStyle(
            color: character.status == 'Alive'
                ? const Color(0XFF42D048)
                : Colors.red,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.60,
            letterSpacing: 1.50,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          character.name ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 1.50,
            letterSpacing: 0.50,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          '${character.species},${character.gender}',
          style: const TextStyle(
            color: Color(0XFF6E798C),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.33,
            letterSpacing: 0.50,
          ),
        ),
      ],
    );
  }
}
