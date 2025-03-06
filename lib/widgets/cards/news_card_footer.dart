import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/endpoints.dart';
import 'package:news_app/core/extensions/context_extension.dart';
import 'package:news_app/core/extensions/date_extension.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:share_plus/share_plus.dart';

class NewsCardFooter extends StatelessWidget {
  const NewsCardFooter({
    required this.news,
    super.key,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final formatterDate = (news.dateCreated ?? DateTime.now()).yMMMEd;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (news.author != null)
                Text(
                  news.author!,
                  style: context.styles.titleMedium,
                ),
              const Gap(4),
              Text(formatterDate),
            ],
          ),
        ),
        IconButton.filledTonal(
          onPressed: () {
            Share.share(
              Endpoints.postDetail(news.id),
              subject: news.title,
            );
          },
          icon: const Icon(
            Icons.share_rounded,
          ),
        ),
        IconButton.filledTonal(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_outlined,
          ),
        ),
      ],
    );
  }
}
