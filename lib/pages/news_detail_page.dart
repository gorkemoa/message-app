import 'package:flutter/material.dart';
import 'package:message_app/models/news.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;

  NewsDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'Haber Detayı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
              Image.network(article.urlToImage!),
            SizedBox(height: 10),
            Text(
              article.title ?? 'Başlık Yok',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              article.publishedAt ?? 'Tarih Yok',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Text(
              article.description ?? 'Açıklama Yok',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            Text(
              article.content ?? 'İçerik Yok',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
