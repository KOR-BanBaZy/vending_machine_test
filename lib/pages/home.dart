import 'package:flutter/material.dart';
import '../sections/signature_products.dart';
import '../sections/all_products.dart';
import '../sections/business_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('주문 페이지')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SignatureProductsSection(),
              SizedBox(height: 16),
              AllProductsSection(),
              SizedBox(height: 16),
              // BusinessInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
