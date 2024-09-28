import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/model/sources_response/Source.dart';
import 'package:news_app/ui/home/categories_tab/category_details/category_details_viewModel.dart';
import 'package:news_app/ui/home/categories_tab/category_details/source_tab.dart';
import 'package:news_app/ui/home/categories_tab/category_item.dart';

class CategoryDetails extends StatefulWidget {
  CategoryItem catItem;

  CategoryDetails({required this.catItem});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late CategoryDetailsViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = CategoryDetailsViewModel();
    viewModel.getSources(widget.catItem.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Text(state.errorMessage ?? ''),
              );
            }
          case SuccessState():
            {
              List<Source> sourcesList = state.sourcesList ?? [];
              return SourceTabs(sourcesList: sourcesList);
            }
        }
      },
    );
  }
}
