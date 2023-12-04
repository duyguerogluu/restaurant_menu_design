class CategoryItem {
  final String image;
  final String name;
  final String desc;
  final String extraInfo;
  final List<PriceItem> prices;

  CategoryItem({
    required this.image,
    required this.name,
    required this.desc,
    required this.extraInfo,
    required this.prices,
  });

  factory CategoryItem.fromJsonData(Map<String, dynamic> data) {
    var prices = data['prices'] as Map;
    return CategoryItem(
      image: data['image'],
      name: data['name'],
      desc: data['desc'],
      extraInfo: data['extraInfo'],
      prices: prices.keys
          .map((key) => PriceItem(type: key, price: prices[key]))
          .toList(),
    );
  }
}

class PriceItem {
  final String type;
  final double price;

  PriceItem({
    required this.type,
    required this.price,
  });
}
