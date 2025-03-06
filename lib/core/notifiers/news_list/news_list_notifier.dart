import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../api/news_api.dart';
import 'news_list_state.dart';

class NewsListNotifier extends ChangeNotifier {
  NewsListState _state = NewsListLoadingState();

  NewsListState get state => _state;

  final _api = NewsApi();

  Future<void> fetchNews({bool skipLoading = false}) async {
    if (_state is! NewsListLoadingState && !skipLoading) {
      updateState(NewsListLoadingState());
    }

    try {
      final res = await _api.fetchNews();

      await Future.delayed(1.seconds);

      updateState(NewsListDataState(res));
    } catch (error, _) {
      updateState(
        NewsListErrorState(
          error.toString(),
        ),
      );
      return;
    }
  }

  Future<void> refresh() {
    return fetchNews(skipLoading: true);
  }

  void updateState(NewsListState newState) {
    _state = newState;
    notifyListeners();
  }
}
