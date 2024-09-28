import 'package:flutter/material.dart';
import 'package:news_app/api/model/sources_response/Source.dart';
import 'package:news_app/ui/home/categories_tab/category_details/news_details.dart';
import 'package:news_app/ui/widgets/source_item_widget.dart';

class SourceTabs extends StatefulWidget {
  List<Source> sourcesList;

  SourceTabs({required this.sourcesList});

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                // tabAlignment: TabAlignment.start,
                padding: EdgeInsets.all(0),
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sourcesList
                    .map((source) => SourceItemWidget(
                          source: source,
                          isSelected: selectedIndex ==
                              widget.sourcesList.indexOf(source),
                        ))
                    .toList())),
        Expanded(child: NewsDetails(source: widget.sourcesList[selectedIndex]))
      ],
    );
  }
}
