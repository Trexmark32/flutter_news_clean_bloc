import 'package:flutter_clean_demo/features/article/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.title,
    super.description,
    super.content,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.author,
    super.sourceName,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      sourceName: json['source'] != null && json['source']['name'] != null
          ? json['source']['name'] as String?
          : null,
    );
  }
}
