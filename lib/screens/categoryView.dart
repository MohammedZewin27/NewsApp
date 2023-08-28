import 'package:flutter/material.dart';
import 'package:newsapp/lists/listOfCategory.dart';

import '../widgets/categorysListView.dart';
import '../widgets/newsListView.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
        
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            NewsListView(category: category,),
          ],
        ),
      ),
    );
  }
}
