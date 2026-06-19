import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:projek_pemob/pin_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> allImages = [
    "https://picsum.photos/seed/s1/200/300",
    "https://picsum.photos/seed/s2/200/400",
    "https://picsum.photos/seed/s3/200/250",
    "https://picsum.photos/seed/s4/200/350",
    "https://picsum.photos/seed/s5/200/450",
    "https://picsum.photos/seed/s6/200/200",
    "https://picsum.photos/seed/s7/200/300",
    "https://picsum.photos/seed/s8/200/430",
    "https://picsum.photos/seed/s8/200/200",
    "https://picsum.photos/seed/s8/200/500",
    "https://picsum.photos/seed/s8/200/250",
    "https://picsum.photos/seed/s8/200/440",
    "https://picsum.photos/seed/s8/200/450",
    "https://picsum.photos/seed/s8/200/500",
  ];

  List<String> filteredImages = [];

  @override
  void initState() {
    super.initState();
    filteredImages = allImages;
    _searchController.addListener(() {
      setState(() {
        filteredImages = allImages
            .where((url) => url.contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Cari pin...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        itemCount: filteredImages.length,
        itemBuilder: (context, index) {
          return PinCard(imageUrl: filteredImages[index]);
        },
      ),
    );
  }
}
