import 'package:flutter/material.dart';
import 'package:projek_pemob/detail_screen.dart';
import 'package:projek_pemob/saved_pins.dart';

class PinCard extends StatelessWidget {
  const PinCard({super.key, required this.imageUrl, this.isSaved = false});
  final String imageUrl;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(imageUrl: imageUrl),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(imageUrl),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isSaved
                        ? ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Hapus'),
                            onTap: () {
                              SavedPins.savedPins.remove(imageUrl);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Gambar Berhasil Dihapus, silahkan reload')));
                            },
                          )
                        : ListTile(
                            leading: Icon(Icons.save),
                            title: Text('Simpan'),
                            onTap: () {
                              SavedPins.savedPins.add(imageUrl);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Gambar Berhasil Disimpan')));
                            },
                          ),
                    ListTile(
                        leading: Icon(Icons.share), title: Text('Bagikan')),
                    ListTile(
                        leading: Icon(Icons.hide_source),
                        title: Text('Sembunyikan')),
                  ],
                ),
              );
            },
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
