import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favoritesMeal;
  Favourites(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeal[index].id,
            title: favoritesMeal[index].title,
            imageUrl: favoritesMeal[index].imageUrl,
            duration: favoritesMeal[index].duration,
            complexity: favoritesMeal[index].complexity,
            affordabilty: favoritesMeal[index].affordability,
          
          );
        },
        itemCount: favoritesMeal.length,
      );
    }
  }
}
