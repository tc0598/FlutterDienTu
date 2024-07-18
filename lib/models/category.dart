
class CategoryModel {
    int id;
    String name;
    String imageUrl;
    String desc;

    CategoryModel({
        required this.id,
        required this.name,
        required this.imageUrl,
        required this.desc,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        imageUrl: json["imageURL"] ?? "",
        desc: json["description"] ?? "",
    );
}


class Category{
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "Tất cả", 
    image: "images/tatca.png",
  ),
  Category(
    title: "Điện thoại", 
    image: "images/dienthoai.png",
  ),
  Category(
    title: "Laptop", 
    image: "images/laptop.png",
  ),
  Category(
    title: "Đồng hồ", 
    image: "images/dongho.png",
  ),
  Category(
    title: "Âm thanh", 
    image: "images/amthanh.png",
  ),
  Category(
    title: "Tivi", 
    image: "images/tivi.png",
  ),
];