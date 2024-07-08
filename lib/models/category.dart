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