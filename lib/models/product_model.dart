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
    title: "Ti vi 1",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi1.jpg",
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
    title: "Ti vi 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi2.jpg",
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
    title: "Ti vi 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi3.jpg",
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
    title: "Ti vi 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi4.jpg",
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
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels",
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
    title: "Điện thoại 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dienthoai2.jpg",
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
    title: "Điện thoại 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dienthoai3.jpg",
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
    title: "Điện thoại 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dienthoai4.jpg",
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
    title: "Macbook Air M1",
    description:
        "Macbook Air M1 là dòng sản phẩm có thiết kế mỏng nhẹ, sang trọng và tinh tế cùng với đó là giá thành phải chăng nên MacBook Air đã thu hút được đông đảo người dùng yêu thích và lựa chọn.",
    image: "images/air_m2.png",
    price: 18690000,
    seller: "NTC",
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "Laptop",
    review: "(270 đánh giá)",
    rate: 4.8,
    quantity: 1,
  ),
  Product(
    title: "Laptop 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/laptop2.jpg",
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
    title: "Laptop 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/laptop3.jpg",
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
    title: "Laptop 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/laptop4.jpg",
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
    title: "Đồng hồ 1",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho1.jpg",
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
    title: "Đồng hồ 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho2.jpg",
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
    title: "Đồng hồ 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho3.jpg",
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
    title: "Đồng hồ 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho4.jpg",
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
    title: "Tai nghe 1",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe1.jpg",
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
    title: "Tai nghe 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe2.jpg",
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
    title: "Tai nghe 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe3.jpg",
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
    title: "Tai nghe 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe4.jpg",
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

final List<Product> phones = [
  Product(
    title: "iPhone 15 Pro Max",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels",
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
    title: "Điện thoại 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dienthoai2.jpg",
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
    title: "Điện thoại 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dienthoai3.jpg",
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
    title: "Điện thoại 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dienthoai4.jpg",
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

final List<Product> laptops = [
   Product(
    title: "Macbook Air M1",
    description:
        "Macbook Air M1 là dòng sản phẩm có thiết kế mỏng nhẹ, sang trọng và tinh tế cùng với đó là giá thành phải chăng nên MacBook Air đã thu hút được đông đảo người dùng yêu thích và lựa chọn.",
    image: "images/air_m2.png",
    price: 18690000,
    seller: "NTC",
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    category: "Laptop",
    review: "(270 đánh giá)",
    rate: 4.8,
    quantity: 1,
  ),
  Product(
    title: "Laptop 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/laptop2.jpg",
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
    title: "Laptop 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/laptop3.jpg",
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
    title: "Laptop 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/laptop4.jpg",
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

final List<Product> watches = [
 Product(
    title: "Đồng hồ 1",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho1.jpg",
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
    title: "Đồng hồ 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho2.jpg",
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
    title: "Đồng hồ 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho3.jpg",
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
    title: "Đồng hồ 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/dongho4.jpg",
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

final List<Product> headphones = [
  Product(
    title: "Tai nghe 1",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe1.jpg",
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
    title: "Tai nghe 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe2.jpg",
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
    title: "Tai nghe 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe3.jpg",
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
    title: "Tai nghe 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tainghe4.jpg",
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

final List<Product> televisions = [
  Product(
    title: "Ti vi 1",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi1.jpg",
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
    title: "Ti vi 2",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi2.jpg",
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
    title: "Ti vi 3",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi3.jpg",
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
    title: "Ti vi 4",
    description:
        "iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inches với độ phân giải 2796 x 1290 pixels, cung cấp trải nghiệm hình ảnh sắc nét, chân thực. So với các phiên bản tiền nhiệm, thế hệ iPhone 15 bản Pro Max đảm bảo mang tới hiệu năng mạnh mẽ với sự hỗ trợ của chipset Apple A17 Pro, cùng bộ nhớ ấn tượng. Đặc biệt hơn, điện thoại iPhone 15 ProMax mới này còn được đánh giá cao với camera sau 48MP và camera trước 12MP, hỗ trợ chụp ảnh với độ rõ nét cực đỉnh.",
    image: "images/tivi4.jpg",
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
