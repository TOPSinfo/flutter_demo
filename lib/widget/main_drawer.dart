import 'package:flutter/material.dart';
import 'package:my_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(fontFamily: 'OpenSans-Bold', fontSize: 14),
        ),
        onTap: () => tabHandler());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cokking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 13,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            // Navigator.of(context).pushNamed('/');
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed('/');
            });
          }),

          buildListTile('Filter', Icons.settings, () {
            // Navigator.of(context).pushNamed(FilterScreen.routeName);
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            });
          }),
        ],
      ),
    );
  }
}
