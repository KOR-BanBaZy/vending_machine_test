import 'package:flutter/material.dart';

class BusinessInfoSection extends StatelessWidget {
  const BusinessInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFF5F6F8), // Light grey background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            '사업자 정보',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF767676),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '상호 : 반바지 소프트 | 대표자 : 이웅표',
            style: TextStyle(fontSize: 12, color: Color(0xFF767676)),
          ),
          SizedBox(height: 4),
          Text(
            '주소 : 경기도 이천시',
            style: TextStyle(fontSize: 12, color: Color(0xFF767676)),
          ),
          SizedBox(height: 4),
          Text(
            '사업자등록번호 : xxxxxxxxx',
            style: TextStyle(fontSize: 12, color: Color(0xFF767676)),
          ),
          SizedBox(height: 4),
          Text(
            '전화번호 : 010-3907-3238',
            style: TextStyle(fontSize: 12, color: Color(0xFF767676)),
          ),
        ],
      ),
    );
  }
}
