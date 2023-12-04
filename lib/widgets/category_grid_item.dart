import 'package:flutter/material.dart';
import 'package:restaurant_menu_design/models/category_item_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.categoryItem,
    required this.onAddBasketPressed,
  });

  final CategoryItem categoryItem;
  final void Function(CategoryItem, PriceItem) onAddBasketPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                  'https://picsum.photos/512',
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress?.cumulativeBytesLoaded ==
                              loadingProgress?.expectedTotalBytes
                          ? child
                          : const SizedBox(
                              height: 128,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CircularProgressIndicator(),
                                  ],
                                ),
                              ),
                            ),
                  width: MediaQuery.of(context).size.width,
                  height: 128,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            categoryItem.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (categoryItem.extraInfo.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                categoryItem.extraInfo,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                        ],
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget fermentum nisi, et pretium leo. Nulla tempor blandit fermentum. Proin.",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: categoryItem.prices
                        .map<Widget>(
                          (price) => Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      price.type,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 8)),
                                    Text('${price.price.toInt()}₺'),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () =>
                                    onAddBasketPressed(categoryItem, price),
                                child: const Text('Sepete ekle'),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
