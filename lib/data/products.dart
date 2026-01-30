import '../models/product.dart';

const List<Product> products = [
  Product(
    id: 'p1',
    name: '시원한 오렌지 탄산 350ml',
    price: 1100,
    imagePath: 'assets/images/products/prod_01.png',
    isSignature: true,
    category: '탄산',
    tags: ['인기'],
  ),
  Product(
    id: 'p2',
    name: '콜라 350ml',
    price: 1500,
    imagePath: 'assets/images/products/prod_02.png',
    isSignature: true,
    category: '탄산',
    tags: ['인기'],
  ),

  Product(
    id: 'p3',
    name: '수분 보충 파워에이드 500ml',
    price: 2100,
    imagePath: 'assets/images/products/prod_03.jpg',
    category: '스포츠 음료',
    tags: ['신메뉴', '인기'],
  ),
  Product(
    id: 'p4',
    name: '시원 청량 레몬 탄산 350ml',
    price: 1000,
    imagePath: 'assets/images/products/prod_04.png',
    category: '탄산',
    tags: ['신메뉴', '인기'],
  ),

  Product(
    id: 'p5',
    name: '과일 주스 700ml',
    price: 3100,
    imagePath: 'assets/images/products/prod_05.jpg',
    category: '주스',
    tags: ['추천'],
  ),
];
