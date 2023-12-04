import 'package:flutter/material.dart';
import 'package:restaurant_menu_design/models/menu_data_model.dart';
import 'package:restaurant_menu_design/widgets/category_grid.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var items = MenuData.fromImportedData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: items.categories.map<Widget>((category) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.categoryName),
                  Text(category.categoryDesc),
                  CategoryGrid(
                    categoryItems: category.categoryItems,
                    gridCount: 2,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
