import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/extensions/context_extension.dart';
import 'package:news_app/core/notifiers/news_list/news_list_notifier.dart';
import 'package:news_app/widgets/buttons/theme_mode_button.dart';
import 'package:news_app/widgets/cards/news_card.dart';
import 'package:provider/provider.dart';

import '../../core/notifiers/news_list/news_list_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<NewsListNotifier>().fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsListNotifier = context.watch<NewsListNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News app',
          style: context.styles.headlineMedium,
        ),
        centerTitle: false,
        actions: const [
          ThemeModeButton(),
          Gap(16),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: newsListNotifier.refresh,
        child: switch (newsListNotifier.state) {
          NewsListDataState state => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final item = state.data[index];

                return NewsCard(
                  news: item,
                ).animate().fade();
              },
              separatorBuilder: (context, index) {
                return const Gap(16);
              },
              itemCount: state.data.length,
            ),
          NewsListLoadingState _ => const Center(
              child: CircularProgressIndicator(),
            ),
          NewsListErrorState state => Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
              ),
            ),
        },
      ),
    );
  }
}
