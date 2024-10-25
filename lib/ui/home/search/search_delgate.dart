import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news_response/NewsResponse.dart';
import 'package:news_app/core/theme/my_theme_data.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context), // Triggers the search
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null); // Close the search delegate
      },
      icon: const Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return _buildErrorWidget(
            context,
            'Something went wrong. Please try again.',
            () => showResults(context), // Retry search
          );
        } else if (snapshot.hasData) {
          final newsResponse = snapshot.data!;
          if (newsResponse.status != 'ok') {
            return _buildErrorWidget(
              context,
              newsResponse.message ?? 'An error occurred.',
              () => showResults(context),
            );
          } else if (newsResponse.articles?.isNotEmpty ?? false) {
            return ListView.builder(
              itemCount: newsResponse.articles!.length,
              itemBuilder: (context, index) {
                final article = newsResponse.articles![index];
                return ListTile(
                  title: Text(article.title ?? 'No Title'),
                  subtitle: Text(article.description ?? 'No Description'),
                );
              },
            );
          } else {
            return _buildErrorWidget(
              context,
              'No results found. Please try another search.',
              () => showResults(context),
            );
          }
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }

  Widget _buildErrorWidget(
      BuildContext context, String message, VoidCallback onRetry) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
          child: Text('Enter a search term to see suggestions.'));
    }

    return FutureBuilder<NewsResponse?>(
      future: ApiManager.searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return _buildErrorWidget(
            context,
            'Something went wrong. Please try again.',
            () => showSuggestions(context), // Retry suggestions
          );
        } else if (snapshot.hasData) {
          final newsResponse = snapshot.data!;
          if (newsResponse.status != 'ok') {
            return _buildErrorWidget(
              context,
              newsResponse.message ?? 'An error occurred.',
              () => showSuggestions(context),
            );
          } else if (newsResponse.articles?.isNotEmpty ?? false) {
            return ListView.builder(
              itemCount: newsResponse.articles!.length,
              itemBuilder: (context, index) {
                final article = newsResponse.articles![index];
                return ListTile(
                  title: Text(article.title ?? 'No Title'),
                  subtitle: Text(article.description ?? 'No Description'),
                );
              },
            );
          } else {
            return const Center(child: Text('No suggestions found.'));
          }
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
