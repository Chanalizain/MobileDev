import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Linna",
  position: "Flutter Developer",
  avatarUrl: 'asset/linna.jfif',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.email, title: "Mail", value: "linna@cadt.edu"),
    TileData(icon: Icons.local_activity, title: "Fav Hobby", value: "Playing wierd video game, using silly dog sticker and looking at herself in the mirror at any chance possible"),
    TileData(icon: Icons.local_drink, title: "Fav Drink", value: "matcha kirisu with 30% sweet"),
  ],
);
