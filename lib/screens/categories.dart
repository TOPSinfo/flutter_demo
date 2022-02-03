import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widget/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:const EdgeInsets.all(25),
        children: DUMMY_CATEGEORY
            .map(
              (catData) => CategoryItem(catData.id,catData.title, catData.color),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio:3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15
            ),
      );
  }
}
