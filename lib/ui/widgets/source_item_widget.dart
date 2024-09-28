import 'package:flutter/material.dart';
import 'package:news_app/api/model/sources_response/Source.dart';

class SourceItemWidget extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceItemWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6,
      ),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
              width: 2, color: isSelected ? Colors.transparent : Colors.green)),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
