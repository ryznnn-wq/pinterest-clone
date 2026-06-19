import 'package:flutter/material.dart';
import 'package:projek_pemob/pin_card.dart';
import 'package:projek_pemob/saved_pins.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 50,
            ),
          ),
          Text('Nama Pengguna'),
          Text('Email@pengguna.com'),
          Expanded(
              child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: EdgeInsets.all(40),
            itemCount: SavedPins.savedPins.length,
            itemBuilder: (context, index) {
              return PinCard(
                imageUrl: SavedPins.savedPins[index],
                isSaved: true,
              );
            },
          ))
        ],
      ),
    );
  }
}
