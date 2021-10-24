import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final saveFilters;
  final Map<String ,bool>currentFilters;

  const FiltersScreen(
    this.saveFilters,
      this.currentFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan =widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }
  Widget buildSwitchListTile(String _title, String _subtitle, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(_title),
      value: currentValue,
      subtitle: Text(_subtitle),
      onChanged: updateValue,
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String,bool> selectedFilters={
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal Selection',
              style: (Theme.of(context).textTheme.title),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile("Gluten-free",
                    'only include gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    "Lactose-free",
                    'only include lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile("Vegan", 'only include Vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchListTile(
                    "Vegetarian", 'only include Vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
