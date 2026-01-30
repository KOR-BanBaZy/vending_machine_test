import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/product.dart';

class SignatureProductsSection extends StatelessWidget {
  const SignatureProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter signature items
    final signatureItems = products.where((p) => p.isSignature).toList();

    if (signatureItems.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '추천메뉴',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Handle See More tap
                },
                child: const Text(
                  '더보기 >',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Horizontal List
        SizedBox(
          height: 250, // Fixed height for the card container
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: signatureItems.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _buildSignatureItem(signatureItems[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSignatureItem(Product product) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container with Tag
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.imagePath,
                  width: 160,
                  height: 120, // Aspect ratio roughly 4:3
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 160,
                      height: 120,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Primary blue color for 'Popular'
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '인기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Product Name
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500, // Slightly less bold than header
            ),
          ),
          const SizedBox(height: 4),

          // Price
          Text(
            '${_formatPrice(product.price)}원',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
