import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_demo/features/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:flutter_clean_demo/features/article/presentation/widgets/article_page_item.dart';
import 'package:flutter_clean_demo/injection_container.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      create: (context) => sl()..add(const GetArticleEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Top Headlines')),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ArticleLoaded) {
              if (state.articles == null || state.articles!.isEmpty) {
                return const Center(child: Text('No articles found.'));
              }
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.articles!.length,
                itemBuilder: (context, index) {
                  return ArticlePageItem(article: state.articles![index]);
                },
              );
            }
            if (state is ArticleError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Failed to load articles: ${state.error?.message ?? 'Unknown error'}',
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ArticleBloc>().add(
                          const GetArticleEvent(),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text('Welcome! Pull to refresh or initial load pending.'),
            );
          },
        ),
      ),
    );
  }
}
