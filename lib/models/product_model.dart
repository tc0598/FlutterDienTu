
class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final dynamic price;
  final int categoryID;
  final String categoryName;

  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.categoryID,
    required this.categoryName,
    required this.quantity,
  });
      factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json["description"] ?? '',
        image: json["imageURL"] ?? '',
        price: json["price"] ?? 0,
        categoryID: json["categoryID"] ?? 0,
        categoryName: json["categoryName"] ?? '',
        quantity: 0,

    );
}

final List<Product> products = [
    
];


final List<Product> phones = [
];

final List<Product> headphones = [
  
];

final List<Product> televisions = [
  
];
