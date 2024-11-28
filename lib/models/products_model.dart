class ProductsModel {
  final int id;
  final double price;
  final double oldprice;
  final double discount;
  final String name;
  final String imageUrl;
  final String description;
  final List<dynamic> images;
  bool inWishlist;
  final bool inCart;
  int? quantity;

  ProductsModel({
    required this.id,
    required this.description,
    required this.discount,
    required this.name,
    required this.imageUrl,
    required this.images,
    required this.inCart,
    this.inWishlist = false,
    required this.oldprice,
    required this.price,
    required this.quantity,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      oldprice: (json['old_price'] ?? 0).toDouble(),
      imageUrl: json['image'] ?? '',
      discount: (json['discount'] ?? 0).toDouble(),
      images: List<dynamic>.from(json['images'] ?? []),
      inWishlist: json['in_favorites'] ?? false,
      inCart: json['in_cart'] ?? false,
      quantity: json['quantity'],
    );
  }
}
