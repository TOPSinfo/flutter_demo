import 'package:flutter/material.dart';
import 'package:my_app/model/meal.dart';
import '../screens/favourites.dart';
import '../screens/categories.dart';
import '../widget/main_drawer.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;
  Tabs(this.favoriteMeals);

  @override
  __TabsState createState() => __TabsState();
}

class __TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages=[];

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': Categories(), 'label': 'Categories'},
      {'page': Favourites(widget.favoriteMeals), 'label': 'Favourites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['label'].toString()),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite'),
          ]),
    );
  }
}
