class Product {
  String itemid;
  String? name;
  List<String>? images;
  String image;
  int stock;
  int likedCount;
  int price;
  int? priceBeforeDiscount;
  String discount;
  String shopLocation;
  ProductRating? itemRating;
  int historicalSold;

  Product({
    required this.itemid,
    this.name,
    this.images,
    required this.image,
    required this.stock,
    required this.likedCount,
    required this.price,
    this.priceBeforeDiscount,
    required this.discount,
    required this.shopLocation,
    this.itemRating,
    this.historicalSold = 0,
  });

  Product.fromJson(Map<String, dynamic> json)
      : itemid = json['itemid'].toString(),
        historicalSold = json['historical_sold'] ?? 0,
        name = json['name'] ?? "",
        image =
            "https://down-vn.img.susercontent.com/file/${json['image'] ?? ""}",
        stock = json['stock'] ?? 0,
        likedCount = json['liked_count'] ?? 0,
        price = (json['price'] ?? 0.0) ~/ 10000,
        priceBeforeDiscount = (json['price_before_discount'] ?? 0) ~/ 10000,
        discount = json['discount'] ?? "",
        shopLocation = json['shop_location'] ?? "",
        itemRating = ProductRating.fromJson(
          json['item_rating'],
        );
}

class ProductRating {
  List<int>? ratingCount;
  num? ratingStar;
  ProductRating({
    this.ratingCount,
    this.ratingStar,
  });

  ProductRating.fromJson(Map<String, dynamic>? json)
      : ratingCount = List<int>.from(json?['rating_count']),
        ratingStar =
            num.tryParse((json?['rating_star'] ?? 0.0).toStringAsFixed(1));
}
