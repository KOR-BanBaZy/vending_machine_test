import 'package:flutter/material.dart';
import '../data/products.dart';

class SignatureProductsSection extends StatelessWidget {
  const SignatureProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final signatureItems = products.where((p) => p.isSignature).toList();

    return Column(crossAxisAlignment: CrossAxisAlignment.start);
  }
}
