import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories_tab/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryItem catItem;
  int index;

  CategoryWidget({required this.catItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: catItem.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(index.isEven ? 25 : 0),
          bottomRight: Radius.circular(index.isEven ? 0 : 25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            catItem.imagePath,
            width: 130,
            height: 115,
          ),
          Text(
            catItem.title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
