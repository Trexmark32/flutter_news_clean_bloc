import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? author;
  final String? sourceName;

  const ArticleEntity({
    this.title,
    this.description,
    this.content,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.author,
    this.sourceName,
  });

  @override
  List<Object?> get props => ([
    title,
    description,
    content,
    url,
    urlToImage,
    publishedAt,
    author,
    sourceName,
  ]);
}
