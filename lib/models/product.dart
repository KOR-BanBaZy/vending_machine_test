class Product {
  final String id;
  final String name;
  final int price;
  final String imagePath;
  final bool isSignature;
  final String category;
  final List<String> tags;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    this.isSignature = false,
    required this.category,
    this.tags = const [],
  });
}
