import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreens extends StatefulWidget {

  final List<Meal>favoriteMeals;

  const TabsScreens(this.favoriteMeals);

  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override

  void initState(){
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      }

    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(
                "Categories",
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text(
                "Favorite",
              )
          ),
        ],
      ),
      drawer:MainDrawer() ,
    );
  }


}
