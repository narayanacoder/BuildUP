class Category{
  String imageUrl;
  String categoryName;

  Category({this.imageUrl, this.categoryName});
}

List<Category> categories = [
  Category(
    imageUrl: "images/restaurantsCategory.jpg",
    categoryName: "Restaurants"
  ),
  Category(
      imageUrl: "images/groceryCategory.jpg",
      categoryName: "Grocery Stores"
  ),
  Category(
      imageUrl: "images/parksCategory.jpg",
      categoryName: "Park and Trails"
  ),
];