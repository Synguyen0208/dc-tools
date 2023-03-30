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
  });

  Product.fromJson(Map<String, dynamic> json)
      : itemid = json['itemid'].toString(),
        name = json['name'] ?? "",
        image =
            "https://down-vn.img.susercontent.com/file/${json['image'] ?? ""}",
        stock = json['stock'] ?? 0,
        likedCount = json['liked_count'] ?? 0,
        price = json['price'] ?? 0.0,
        priceBeforeDiscount = json['price_before_discount'],
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
        ratingStar = json?['rating_star'] ?? 0.0;
}
