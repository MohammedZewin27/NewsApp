import 'package:flutter/material.dart';
import 'package:newsapp/screens/categoryView.dart';

import '../model/categoryModel.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return  CategoryView(category: categoryModel.categoryName,);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          // height: 85,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(categoryModel.image), fit: BoxFit.fill),
          ),
          child: Center(
              child: Text(
            categoryModel.categoryName,
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
