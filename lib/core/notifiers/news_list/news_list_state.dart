import 'package:equatable/equatable.dart';
import 'package:news_app/core/models/news_model.dart';

sealed class NewsListState extends Equatable {}

class NewsListLoadingState extends NewsListState {
  @override
  List<Object?> get props => [];
}

class NewsListDataState extends NewsListState {
  NewsListDataState(this.data);

  final List<NewsModel> data;

  @override
  List<Object?> get props => [];
}

class NewsListErrorState extends NewsListState {
  NewsListErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [];
}
