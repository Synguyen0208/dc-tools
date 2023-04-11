class Category {
  String id;
  String name;
  String image;
  int totalProduct;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.totalProduct,
  });
  Category.fromJson(Map<String, dynamic> json)
      : id = json['shop_category_id'].toString(),
        name = json['display_name'] ?? "",
        image =
            "https://down-vn.img.susercontent.com/file/${json['image'] ?? ""}",
        totalProduct = json['total'] ?? 0;

  Map<String, dynamic> toJson() => {
        'shop_category_id': id,
        'display_name': name,
        'image': image,
        'total': totalProduct,
      };
}
