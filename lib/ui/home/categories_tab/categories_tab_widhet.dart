import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories_tab/category_item.dart';
import 'package:news_app/ui/widgets/category_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryItem catItem);

class CategoriesTabWidget extends StatelessWidget {
  List<CategoryItem> allCategories = CategoryItem.getCategoriesList();
  OnCategoryItemClicked onCategoryItemClicked;

  CategoriesTabWidget({required this.onCategoryItemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4F5A69)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryItemClicked(allCategories[index]);
                },
                child: CategoryWidget(
                  catItem: allCategories[index],
                  index: index,
                ),
              ),
              itemCount: allCategories.length,
            ),
          ),
        ],
      ),
    );
  }
}
