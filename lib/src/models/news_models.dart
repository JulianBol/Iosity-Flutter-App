import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

NewsResponse newsResponseFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
    String status;
    int totalResults;
    List<Article> articles;

    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Source source;
    dynamic author;
    dynamic title;
    dynamic description;
    String url;
    dynamic urlToImage;
    String publishedAt;
    dynamic content;

    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: formatDate(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
    };
}

class Source {
    String? id;
    String name;

    Source({
        required this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

String formatDate(String date) {

    initializeDateFormatting('en_US', null);
      
    DateTime objectDate = DateTime.parse(date);

    final DateFormat formatterWeekDay = DateFormat.E('en_US');
    final DateFormat formatterDay = DateFormat.d('en_US');
    final DateFormat formatterMonth = DateFormat.MMM('en_US');
    final DateFormat formatterYear = DateFormat.y('en_US');

    String weekDay = formatterWeekDay.format(objectDate);
    String day = formatterDay.format(objectDate);
    String month = formatterMonth.format(objectDate);
    String year = formatterYear.format(objectDate);

    return '$weekDay $day $month $year';
}