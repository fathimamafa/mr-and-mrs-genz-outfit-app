class ProductModel {
  final String id;

  final String name;

  final String description;

  final String price;

  final String image;

  final String category;

  final double rating;

  final int reviews;

  final List<String> sizes;

  final List<String> colors;

  final bool isFavorite;

  final bool isTrending;

  final bool isNewArrival;

  final bool isFlashSale;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.sizes,
    required this.colors,
    required this.isFavorite,
    required this.isTrending,
    required this.isNewArrival,
    required this.isFlashSale,
  });

  // FROM FIREBASE
  factory ProductModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ProductModel(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      description: map["description"] ?? "",
      price: map["price"] ?? "",
      image: map["image"] ?? "",
      category: map["category"] ?? "",
      rating: (map["rating"] ?? 0).toDouble(),
      reviews: map["reviews"] ?? 0,
      sizes: List<String>.from(map["sizes"] ?? []),
      colors: List<String>.from(map["colors"] ?? []),
      isFavorite: map["isFavorite"] ?? false,
      isTrending: map["isTrending"] ?? false,
      isNewArrival: map["isNewArrival"] ?? false,
      isFlashSale: map["isFlashSale"] ?? false,
    );
  }

  // TO FIREBASE
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'rating': rating,
      'reviews': reviews,
      'sizes': sizes,
      'colors': colors,
      'isFavorite': isFavorite,
      'isTrending': isTrending,
      'isNewArrival': isNewArrival,
      'isFlashSale': isFlashSale,
    };
  }
}
