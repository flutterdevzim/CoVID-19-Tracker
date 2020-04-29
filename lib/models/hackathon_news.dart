// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
    List<NewsElement> news;
    String status;

    News({
        this.news,
        this.status,
    });

    factory News.fromJson(Map<String, dynamic> json) => News(
        news: List<NewsElement>.from(json["news"].map((x) => NewsElement.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
        "status": status,
    };
}

class NewsElement {
    String author;
    String image;
    String posted;
    String summary;
    String title;
    String url;

    NewsElement({
        this.author,
        this.image,
        this.posted,
        this.summary,
        this.title,
        this.url,
    });

    factory NewsElement.fromJson(Map<String, dynamic> json) => NewsElement(
        author: json["author"],
        image: json["image"],
        posted: json["posted"],
        summary: json["summary"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "image": image,
        "posted": posted,
        "summary": summary,
        "title": title,
        "url": url,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
