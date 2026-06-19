import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: imageUrl,
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(child: Icon(Icons.person)),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Nama author gambar')
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Judul Gambar',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Deskripsi Gambar Ditampilkan Disini')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
