import 'package:flutter/material.dart';
import 'package:newsapp/lists/listOfCategory.dart';

import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 85,
      child: ListView.builder(
        physics:const BouncingScrollPhysics() ,
        scrollDirection: Axis.horizontal,
        itemCount: listOfCategory.length,
        itemBuilder: (context, index) => CategoryCard(categoryModel: listOfCategory[index]),
      ),
    );
  }
}
