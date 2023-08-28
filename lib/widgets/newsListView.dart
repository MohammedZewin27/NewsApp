import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/services/newsServices.dart';

import '../model/article_model.dart';
import 'newTile.dart';

class NewsListView extends StatefulWidget {
  final String category;

  const NewsListView({required this.category, super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  var response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    response = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>?>(
      future: response,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: snapshot.data?.length,
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: NewTile(
                  articleModel: snapshot.data![index],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(child: Text('error'));
        }
        else {
          return const SliverToBoxAdapter(
            child: Column(
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
