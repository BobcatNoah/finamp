import 'package:flutter/material.dart';

import '../../models/JellyfinModels.dart';
import '../../services/processArtist.dart';
import '../printDuration.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key key, @required this.item, @required this.itemSongs})
      : super(key: key);

  final BaseItemDto item;
  final int itemSongs;
// TODO: see if there's a way to expand this column to the row that it's in
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconAndText(Icons.person, processArtist(item.albumArtist)),
        _iconAndText(Icons.music_note, "${itemSongs.toString()} Songs"),
        _iconAndText(Icons.timer,
            printDuration(Duration(microseconds: item.runTimeTicks ~/ 10))),
        _iconAndText(Icons.event, item.productionYear.toString())
      ],
    );
  }
}

Widget _iconAndText(IconData iconData, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          // Inactive icons have an opacity of 50%
          // https://material.io/design/iconography/system-icons.html#color
          color: Colors.white.withOpacity(0.5),
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 2)),
        Text(text)
      ],
    ),
  );
}