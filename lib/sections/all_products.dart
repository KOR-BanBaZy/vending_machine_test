import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/product.dart';

class AllProductsSection extends StatefulWidget {
  const AllProductsSection({super.key});

  @override
  State<AllProductsSection> createState() => _AllProductsSectionState();
}

class _AllProductsSectionState extends State<AllProductsSection> {
  // Extract unique categories from products, ensuring "칼칼한 청양치킨" is first if present, or just implementation order
  late List<String> categories;
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    final uniqueCategories = products.map((p) => p.category).toSet().toList();
    // Sort or arrange categories as per design if needed.
    // For now, let's just use the order they appear or specific order

    // Custom sort to match screenshot tabs: "칼칼한 청양치킨", "뿌리노랑 치킨", "3종 세트", "사이드"
    // We can try to prioritize these if they exist.
    categories = uniqueCategories;

    if (categories.isNotEmpty) {
      // Default to "칼칼한 청양치킨" if available to match screenshot, else first
      if (categories.contains('탄산')) {
        selectedCategory = '칼칼한 청양치킨';
      } else {
        selectedCategory = categories.first;
      }
    } else {
      selectedCategory = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox.shrink();

    final filteredProducts = products
        .where((p) => p.category == selectedCategory)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Category Tabs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: categories.map((category) {
              final isSelected = category == selectedCategory;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1D1D1D)
                          : const Color(0xFFF5F6F8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF767676),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 24),

        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            selectedCategory,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 12),

        // Product List
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return _buildProductItem(product);
          },
        ),
      ],
    );
  }

  Widget _buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tags
                if (product.tags.isNotEmpty)
                  Row(
                    children: product.tags.map((tag) {
                      Color tagColor = Colors.blue;
                      if (tag == '신메뉴') tagColor = Colors.orange;

                      return Container(
                        margin: const EdgeInsets.only(right: 4, bottom: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: tagColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 4),
                Text(product.name, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                Text(
                  '${_formatPrice(product.price)}원',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    // Simple manual formatter for now
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
