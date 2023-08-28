import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../model/article_model.dart';

class NewTile extends StatelessWidget {
  const NewTile({required this.articleModel, super.key});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: FancyShimmerImage(
              imageUrl: '${articleModel.image}',
              width: double.infinity,
              shimmerDuration: const Duration(milliseconds: 4500),
              shimmerBaseColor: Colors.orange,
              shimmerHighlightColor: Colors.black,
              shimmerBackColor: Colors.lightGreen,
              errorWidget: Image.asset(
                  'assets/business.jpeg'),
            )),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.description ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
