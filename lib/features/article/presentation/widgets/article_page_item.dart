import 'package:flutter/material.dart';
import 'package:flutter_clean_demo/features/article/domain/entities/article_entity.dart';
import 'package:intl/intl.dart';

class ArticlePageItem extends StatelessWidget {
  final ArticleEntity article;

  const ArticlePageItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final publishedDate = article.publishedAt != null
        ? DateFormat(
            'MMM dd, yyyy - hh:mm a',
          ).format(DateTime.parse(article.publishedAt!))
        : 'Date not available';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article.urlToImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.broken_image, size: 50),
                      ),
                    );
                  },
                  loadingBuilder:
                      (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                ),
              ),
            const SizedBox(height: 16),
            Text(
              article.title ?? 'No Title',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'By ${article.author ?? article.sourceName ?? 'Unknown Author'}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(publishedDate, style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 12),
            Text(
              article.description ?? article.content ?? 'No Description',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
