import 'dart:convert';

class News {
  final List<Article>? articles;

  News({this.articles});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      articles: (json['articles'] as List?)
          ?.map((item) => Article.fromJson(item))
          .toList(),
    );
  }
}

class Article {
  final String? title;
  final String? description;
  final String? content;
  final String? urlToImage;
  final String? publishedAt;

  Article({
    this.title,
    this.description,
    this.content,
    this.urlToImage,
    this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      content: json['content'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }
}
