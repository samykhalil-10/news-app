import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/sources_response/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  CategoryDetailsViewModel() : super(LoadingState(message: 'Loading...'));

  void getSources(String categoryId) async {
    print('Ana da5alt el func');
    emit(LoadingState(message: 'Loading...'));
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message));
      } else {
        emit(SuccessState(sourcesList: response.sources));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class LoadingState extends CategoryDetailsState {
  String message;

  LoadingState({required this.message});
}

class ErrorState extends CategoryDetailsState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;

  SuccessState({this.sourcesList});
}
