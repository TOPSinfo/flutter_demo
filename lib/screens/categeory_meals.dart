import 'package:flutter/material.dart';
import 'package:my_app/model/meal.dart';
import '../dummy_data.dart';
import '../widget/meal_item.dart';

class Categeory_meals extends StatefulWidget {
  static const routeName = '/categeory_meals';
  final List<Meal> _avialeblmeal;
  Categeory_meals(this._avialeblmeal);

  @override
  State<Categeory_meals> createState() => _Categeory_mealsState();
}

class _Categeory_mealsState extends State<Categeory_meals> {
  String categoryTitle = "";
  late List<Meal> displayMeal;
  bool _loadedInitData = false;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayMeal = widget._avialeblmeal.where((meals) {
        return meals.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeal[index].id,
            title: displayMeal[index].title,
            imageUrl: displayMeal[index].imageUrl,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            affordabilty: displayMeal[index].affordability,
           
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
