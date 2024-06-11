class Category {
  String thumbnail;
  String name;
  String tag;

  Category({required this.name, required this.thumbnail, required this.tag});

  static Category findCategoryByTag(String tag) {
    return categoryList.firstWhere((category) => category.tag == tag);
  }
}

List<Category> categoryList = [
  Category(
      name: "Computer Science",
      thumbnail: "assets/icons/laptop.jpg",
      tag: "CS"),
  Category(name: "Economy", thumbnail: "assets/icons/economy.jpg", tag: "ECO"),
  Category(
      name: "Engineering",
      thumbnail: "assets/icons/engineering.jpg",
      tag: "ENG"),
  Category(
      name: "Psychology", thumbnail: "assets/icons/psychology.jpg", tag: "PSY"),
];
