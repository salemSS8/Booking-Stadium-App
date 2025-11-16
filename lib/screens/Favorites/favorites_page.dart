import 'package:flutter/material.dart';
import 'package:project/screens/main_screen/Widget/stadiumCard.dart';
import 'package:project/screens/main_screen/main_page.dart';
import 'package:project/screens/main_screen/stadium_data.dart';
import 'package:project/screens/main_screen/stadium_details.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List favoriteStadiums = stadiums
      .where((stad) => stad['isFavorite'] == true)
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF319710),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF319710),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Expanded(
        child: Container(
          height: 742,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: favoriteStadiums.length,
            padding: const EdgeInsets.all(19.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 22,
              mainAxisSpacing: 22,
              childAspectRatio: 0.82,
            ),
            itemBuilder: (context, index) {
              final stadium = favoriteStadiums[index];
              return GestureDetector(
                child: StadiumCard(
                  name: stadium['name']! as String,
                  price: stadium['price']! as String,
                  imageUrl: stadium['image']! as String,
                  isFavorite: stadium['isFavorite'] as bool,
                  onFavoritePressed: () {
                    setState(() {
                      stadium['isFavorite'] = !stadium['isFavorite'];
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
