import 'package:flutter/material.dart';
import 'package:restaurant_menu_design/models/category_item_model.dart';
import 'package:restaurant_menu_design/widgets/category_grid_item.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.categoryItems,
    required this.gridCount,
  });
  final List<CategoryItem> categoryItems;
  final int gridCount;

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    var temp = <Widget>[];
    for (var item in categoryItems) {
      temp.add(
        Expanded(
          child: CategoryGridItem(
            categoryItem: item,
            onAddBasketPressed: (item, price) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar(
                reason: SnackBarClosedReason.dismiss,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Basket added ${item.name} ${price.type}'),
                ),
              );
            },
          ),
        ),
      );

      if (temp.isNotEmpty && temp.length % gridCount == 0) {
        children.add(Row(children: [...temp]));
        temp.clear();
      }

      // children.add(_getItem(context, item));
    }

    if (temp.isNotEmpty) {
      children.add(
        Row(
          children: [
            ...temp,
            ...List.generate(
              gridCount - temp.length,
              (index) => const Expanded(
                child: ColoredBox(color: Colors.transparent),
              ),
            ),
          ],
        ),
      );
      temp.clear();
    }

    return Column(children: children);
  }
}
