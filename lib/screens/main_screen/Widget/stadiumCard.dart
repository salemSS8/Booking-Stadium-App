import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StadiumCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final Function()? onFavoritePressed;

  const StadiumCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF319610),
            blurRadius: 15.20,
            offset: Offset(0, 6),
            spreadRadius: -2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imageUrl,
                height: 101,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    color: Colors.grey[200],
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF225022),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF329711),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if(isFavorite)...[
                      GestureDetector(onTap: onFavoritePressed,child: Icon(Icons.favorite, color: Colors.red,)),
                    ]
                    else ...[
                      GestureDetector(onTap: onFavoritePressed,child: Icon(Icons.favorite_outline, color: Colors.red,)),
                    ]
                   //R IconButton(onPressed: (){}, icon:Icon(Icons.heart_broken_outlined,size: 20,))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
