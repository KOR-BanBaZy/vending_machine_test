import '../models/product.dart';

const List<Product> products = [
  // 3종 세트
  Product(
    id: 'p1',
    name: '3종 세트 (오리지널, 순살)',
    price: 21000,
    imagePath: 'assets/images/products/prod_01.png',
    isSignature: true,
    category: '3종 세트',
    tags: ['인기'],
  ),
  Product(
    id: 'p2',
    name: '알싸한 마늘 치킨 (오리지널)',
    price: 21000,
    imagePath: 'assets/images/products/prod_01.png',
    isSignature: true,
    category: '마늘 치킨',
    tags: ['인기'],
  ),

  // 칼칼한 청양치킨
  Product(
    id: 'p3',
    name: 'NEW 칼칼한 청양 치킨 (레귤러, 뼈)',
    price: 21000,
    imagePath: 'assets/images/products/prod_01.png',
    category: '칼칼한 청양치킨',
    tags: ['신메뉴', '인기'],
  ),
  Product(
    id: 'p4',
    name: 'NEW 칼칼한 청양 치킨 (오리지널, 순살)',
    price: 21000,
    imagePath: 'assets/images/products/prod_01.png',
    category: '칼칼한 청양치킨',
    tags: ['신메뉴', '인기'],
  ),

  // 뿌리노랑 치킨
  Product(
    id: 'p5',
    name: '뿌리노랑 치킨 (콤보)',
    price: 19000,
    imagePath: 'assets/images/products/prod_01.png',
    category: '뿌리노랑 치킨',
    tags: ['추천'],
  ),

  // 사이드
  Product(
    id: 'p6',
    name: '치즈볼 (5개)',
    price: 5000,
    imagePath: 'assets/images/products/prod_01.png',
    category: '사이드',
    tags: [],
  ),
  Product(
    id: 'p7',
    name: '콜라',
    price: 1300,
    imagePath: 'assets/images/products/prod_01.png',
    category: '사이드',
    tags: [],
  ),
];
