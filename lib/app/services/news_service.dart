


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {

  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = 'aeea1937a91448bfa2b240af1b0820b0';

  Future<List<Article>> fetchNews({int page = 1, String query = ''}) async {

    try {
      final url = Uri.parse('$_baseUrl/everything?q=${query.isEmpty ? 'latest' : query}&page=$page&apiKey=$_apiKey');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List articlesJson = data['articles'];
        List<Article> articles = articlesJson.map((json) => Article.fromJson(json)).toList();
        return articles;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }

  }

}
