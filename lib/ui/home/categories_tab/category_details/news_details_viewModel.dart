import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news_response/news.dart';

class NewsDetailsViewModel extends Cubit<NewsDetailsState> {
  NewsDetailsViewModel() : super(NewsLoadingState(message: 'Loading...'));

  void getNews(String sourceId) async {
    emit(NewsLoadingState(message: 'Loading...'));
    try {
      var response = await ApiManager.getNews(sourceId);
      if (response.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message));
      } else {
        emit(NewsSuccessState(newsList: response.articles));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsDetailsState {}

class NewsLoadingState extends NewsDetailsState {
  String message;

  NewsLoadingState({required this.message});
}

class NewsErrorState extends NewsDetailsState {
  String? errorMessage;

  NewsErrorState({this.errorMessage});
}

class NewsSuccessState extends NewsDetailsState {
  List<News>? newsList;

  NewsSuccessState({this.newsList});
}
