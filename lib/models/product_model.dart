import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final double price;
  final List<Color> colors;
  final String category;
  final double rate;
  int quantity;

  Product({
    required this.title,
    required this.review,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.seller,
    required this.category,
    required this.rate,
    required this.quantity,
  });
}

final List<Product> products = [
  Product(
    title: "iPhone 15 Pro Max",
    description: "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/iphone-15-pro-max.png",
    price: 29190000,
    seller: "NTC",
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "Điện thoại",
    review: "(320 đánh giá)",
    rate: 4.8,
    quantity: 1,
  ),
  Product(
    title: "iPhone 15 Pro Max",
    description: "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/iphone-15-pro-max.png",
    price: 29190000,
    seller: "NTC",
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "Điện thoại",
    review: "(320 đánh giá)",
    rate: 4.8,
    quantity: 1,
  ),
  Product(
    title: "iPhone 15 Pro Max",
    description: "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/iphone-15-pro-max.png",
    price: 29190000,
    seller: "NTC",
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "Điện thoại",
    review: "(320 đánh giá)",
    rate: 4.8,
    quantity: 1,
  ),
  Product(
    title: "iPhone 15 Pro Max",
    description: "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/iphone-15-pro-max.png",
    price: 29190000,
    seller: "NTC",
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "Điện thoại",
    review: "(320 đánh giá)",
    rate: 4.8,
    quantity: 1,
  ),
];