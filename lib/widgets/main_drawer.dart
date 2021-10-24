import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title , IconData icon , Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTile("Meal" ,Icons.restaurant,(){
            Navigator.pushReplacementNamed(context, '/');
          } ),
          buildListTile("Filters" ,Icons.settings ,(){
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),

        ],
      ),
    );
  }
}
