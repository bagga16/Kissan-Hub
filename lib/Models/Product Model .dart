class Product {
  final String name;
  final double price;
  final double rating;
  final String? description;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.rating,
    this.description,
    required this.imageUrl,
  });
}
