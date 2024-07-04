class Category{
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
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