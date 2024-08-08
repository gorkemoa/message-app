import 'package:flutter/material.dart';
import 'package:message_app/models/news.dart';
import 'package:message_app/services/news_service.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<News> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = NewsService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haberler'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                futureNews = NewsService().fetchNews();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<News>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data!.articles == null ||
              snapshot.data!.articles!.isEmpty) {
            return Center(child: Text('Haber bulunamadı'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                var article = snapshot.data!.articles![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(article: article),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        if (article.urlToImage != null &&
                            article.urlToImage!.isNotEmpty)
                          Image.network(article.urlToImage!), // Sadece resim varsa göster
                        ListTile(
                          title: Text(article.title ?? 'Başlık Yok'),
                          subtitle: Text(article.publishedAt ?? 'Tarih Yok'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
