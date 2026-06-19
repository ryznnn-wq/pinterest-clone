import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:projek_pemob/pin_card.dart';
import 'package:projek_pemob/profil_screen.dart';
import 'package:projek_pemob/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  List<String> untukAnda = [
    "https://picsum.photos/seed/anda1/200/300",
    "https://picsum.photos/seed/anda2/200/350",
    "https://picsum.photos/seed/anda3/200/200",
    "https://picsum.photos/seed/anda4/200/400",
    "https://picsum.photos/seed/anda5/200/250",
  ];

  List<String> animasi = [
    "https://picsum.photos/seed/anim1/200/300",
    "https://picsum.photos/seed/anim2/200/400",
    "https://picsum.photos/seed/anim3/200/250",
    "https://picsum.photos/seed/anim4/200/350",
    "https://picsum.photos/seed/anim5/200/450",
  ];

  List<String> referensi = [
    "https://picsum.photos/seed/ref1/200/300",
    "https://picsum.photos/seed/ref2/200/200",
    "https://picsum.photos/seed/ref3/200/400",
    "https://picsum.photos/seed/ref4/200/350",
    "https://picsum.photos/seed/ref5/200/250",
  ];

  List<String> lainnya = [
    "https://picsum.photos/seed/lain1/200/400",
    "https://picsum.photos/seed/lain2/200/300",
    "https://picsum.photos/seed/lain3/200/350",
    "https://picsum.photos/seed/lain4/200/200",
    "https://picsum.photos/seed/lain5/200/450",
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildGrid(List<String> data) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return PinCard(imageUrl: data[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(text: 'Untuk Anda'),
          Tab(text: 'Animasi'),
          Tab(text: 'Referensi'),
          Tab(text: 'Lainnya'),
        ]),
        centerTitle: true,
        title: Image.asset(
          'assets/pinteres.png',
          height: 45,
          width: 45,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilScreen()));
              },
              icon: Icon(Icons.account_circle)),
          IconButton(
              onPressed: widget.toggleTheme, icon: Icon(Icons.dark_mode)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildGrid(untukAnda),
          buildGrid(animasi),
          buildGrid(referensi),
          buildGrid(lainnya),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilScreen()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
