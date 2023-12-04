import 'category_item_model.dart';

class Category {
  final String categoryName;
  final String categoryDesc;
  final List<CategoryItem> categoryItems;

  Category({
    required this.categoryName,
    required this.categoryDesc,
    required this.categoryItems,
  });

  factory Category.fromJsonData(Map<String, dynamic> data) => Category(
        categoryName: data['name'],
        categoryDesc: data['desc'],
        categoryItems: (data['items'] as List)
            .map(
              (e) => CategoryItem.fromJsonData(e),
            )
            .toList(),
      );
}
