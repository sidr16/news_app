import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/endpoints.dart';
import 'package:news_app/core/models/news_model.dart';

class NewsApi {
  final _client = http.Client();
  final _faker = Faker();

  Map<String, dynamic> get _fakeAdditionalData => {
        'author': _faker.person.name(),
        'date_created': _faker.date.dateTime(maxYear: 2024, minYear: 2023)
      };

  Future<List<NewsModel>> fetchNews() async {
    try {
      final response = await _client.get(
        Uri.parse(Endpoints.posts),
      );

      var jsonList = jsonDecode(
        utf8.decode(response.bodyBytes),
      ) as List<dynamic>;

      return jsonList.map((item) {
        return NewsModel.fromJson({
          ...item,
          ..._fakeAdditionalData,
        });
      }).toList();
    } catch (error) {
      rethrow;
    }
  }
}
