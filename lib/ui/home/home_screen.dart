import 'package:flutter/material.dart';
import 'package:news_app/core/utils/image_utils.dart';
import 'package:news_app/ui/home/categories_tab/categories_tab_widhet.dart';
import 'package:news_app/ui/home/categories_tab/category_details/category_details.dart';
import 'package:news_app/ui/home/categories_tab/category_item.dart';
import 'package:news_app/ui/home/home_drawer/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/ui/home/search/search_delgate.dart';

import 'settings_tab/settings_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTabWidget(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  ImageUtils.getImagePathByName(imageName: 'pattern.png')))),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
            actions: [
              IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: NewsSearchDelegate()),
                icon: const Icon(
                  Icons.search,
                  size: 25,
                ),
              )
            ],
          ),
          drawer: HomeDrawer(onMenuItemClicked: onMenuItemClicked),
          body: selectedWidget // catWidget
          ),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesTabWidget(
            onCategoryItemClicked: onCategoryItemClicked,
          );
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsTabWidget();
        }
    }
    Navigator.pop(context);
    setState(() {});
  }

  onCategoryItemClicked(CategoryItem catItem) {
    selectedWidget = CategoryDetails(
      catItem: catItem,
    );
    setState(() {});
  }
}
