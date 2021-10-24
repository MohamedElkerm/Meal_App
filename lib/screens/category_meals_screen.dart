import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  CategoryMealsScreenState createState() => CategoryMealsScreenState();
}

class CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryID = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryID);
    }
    ).toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override


  void _removeMeal(String mealID){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id==mealID);
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle
        ),
      ),
      body: ListView.builder(
        itemBuilder:(ctx,index){
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
          );
        },
        itemCount:displayMeals.length ,
      ),
    );
  }
}
