// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'FilterScreen';
  final Function saveFilter;
  final Map<String,bool> currentFilter;

  FilterScreen(this.currentFilter,this.saveFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactosFree = false;
  @override
  void initState() {
    // TODO: implement initState
    _glutenFree=widget.currentFilter['gluten'] as bool;
    _vegeterian=widget.currentFilter['vegaterian'] as bool;
    _vegan=widget.currentFilter['vegan'] as bool;
    _lactosFree=widget.currentFilter['lactose'] as bool;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    print(_lactosFree);
    return Scaffold(
        appBar: AppBar(
          title: Text('FILTER DATA'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilter = {
                    'gluten': _glutenFree,
                    'lactose': _lactosFree,
                    'vegan': _vegan,
                    'vegaterian': _vegeterian
                  };
                   widget.saveFilter(selectedFilter);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                    title: Text('Gluten-free'),
                    value: _glutenFree,
                    subtitle: Text('Only include gluten free meal'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('lactosFree'),
                    value: _lactosFree,
                    subtitle: Text('Only include lactos free meal'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactosFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegaterian'),
                    value: _vegeterian,
                    subtitle: Text('Only include Vegaterian meal'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegeterian = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('vegan'),
                    value: _vegan,
                    subtitle: Text('Only include vegan free meal'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),

                // _buildSwitchListTile('Gluteen-free',
                //     'Only include gluteen free meals', _glutenFree, (newValue) {
                //   print('hello');
                //   setState(() {
                //     _glutenFree = newValue;
                //   });
                // }),
                // _buildSwitchListTile(
                //     'lactosFree', 'Only include lactos Free', _lactosFree, () {
                //   print('hello');
                // }),
                // _buildSwitchListTile(
                //     'Vegaterian', 'Only include vegetarian meals', _vegeterian,
                //     () {
                //   print('hello');
                // }),
                // _buildSwitchListTile(
                //     'vegan', 'Only include vegan meals', _vegan, () {
                //   print('hello');
                // }),
              ],
            ))
          ],
        ));
  }
}
