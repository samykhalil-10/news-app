import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/model/news_response/news.dart';
import 'package:news_app/api/model/sources_response/Source.dart';
import 'package:news_app/ui/home/categories_tab/category_details/news_details_viewModel.dart';
import 'package:news_app/ui/widgets/news_item_widget.dart';

class NewsDetails extends StatefulWidget {
  Source source;

  NewsDetails({required this.source});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late NewsDetailsViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = NewsDetailsViewModel();
    viewModel.getNews(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant NewsDetails oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNews(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDetailsViewModel, NewsDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case NewsLoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case NewsErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage ?? ''),
                    ElevatedButton(onPressed: () {}, child: Text('Try again'))
                  ],
                ),
              );
            }
          case NewsSuccessState():
            {
              List<News> newsList = state.newsList ?? [];
              return ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItemWidget(news: newsList[index]),
                itemCount: newsList.length,
              );
            }
        }
      },
    );
  }
}
