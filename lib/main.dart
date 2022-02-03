// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/dummy_data.dart';
import 'package:my_app/model/meal.dart';
import 'screens/filter_screen.dart';
import 'screens/meal_details.dart';
import 'screens/categeory_meals.dart';
import 'screens/categories.dart';
import 'screens/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//this state is belong to myApp class
class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegaterian': false
  };

  List<Meal> _availabelmeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal=[];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availabelmeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] != true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegaterian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId){
   final existingIndex=_favoriteMeal.indexWhere((meal) => meal.id ==mealId);
   if(existingIndex >=0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
   }else{
     setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id ==mealId));
     });
   }
  }

  bool _isMealFavourite(String id){
    return _favoriteMeal.any((meal) => meal.id ==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'OpenSans-Regular',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 2)),
            caption: const TextStyle(
                fontSize: 20,
                fontFamily: 'OpenSans-bold',
                fontWeight: FontWeight.bold)),
      ),
      routes: {
        '/': (ctx) => Tabs(_favoriteMeal),
        Categeory_meals.routeName: (ctx) => Categeory_meals(_availabelmeal),
        MealDetails.routeName: (ctx) => MealDetails(_toggleFavorites,_isMealFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilter),
      },
    );
  }
}
