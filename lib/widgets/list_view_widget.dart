import 'package:flutter/material.dart';
import 'package:rick_morty_app/data/models/charecter_model.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.character,
    required this.onTap,
  });

  final MyCharacter character;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 37,
              backgroundImage: NetworkImage(character.image ?? ''),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.status ?? '',
                  style: const TextStyle(
                    color: Color(0XFF42D048),
                    fontSize: 10,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1.60,
                    letterSpacing: 1.50,
                  ),
                ),
                Text(
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
            )
          ],
        ),
      ),
    );
  }
}
