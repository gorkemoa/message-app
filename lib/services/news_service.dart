import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:message_app/models/news.dart';

class NewsService {
  final String apiKey = '4dcdf6081e6145d8ad75e91c4a8efb0f';
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<News> fetchNews({String country = 'tr'}) async {
    final url = '$baseUrl?country=$country&apiKey=$apiKey';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return News.fromJson(data);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
