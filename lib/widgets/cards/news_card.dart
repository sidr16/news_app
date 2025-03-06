import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/extensions/context_extension.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/pages/detail_page/detail_page.dart';
import 'package:news_app/widgets/cards/news_card_footer.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.news,
    super.key,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Hero(
      tag: ValueKey(news.id),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                fullscreenDialog: true,
                barrierDismissible: true,
                barrierColor: context.colors.onSecondary.withAlpha(100),
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return DetailPage(detail: news);
                },
              ),
            );
          },
          borderRadius: borderRadius,
          child: Ink(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.surfaceContainer,
              borderRadius: borderRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.styles.headlineSmall,
                ),
                const Gap(12),
                Text(
                  news.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: context.styles.bodyMedium,
                ),
                const Divider(),
                NewsCardFooter(
                  news: news,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
