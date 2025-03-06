import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/extensions/context_extension.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/widgets/cards/news_card_footer.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.detail});

  final NewsModel detail;

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      backgroundColor: Colors.transparent,
      onDismissed: () {
        Navigator.pop(context);
      },
      direction: DismissiblePageDismissDirection.down,
      child: Hero(
        tag: ValueKey(detail.id),
        child: Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: ColoredBox(
            color: context.colors.surfaceContainer,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: NewsCardFooter(news: detail),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.title,
                  style: context.styles.titleLarge,
                ),
                const Gap(16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    detail.description,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
