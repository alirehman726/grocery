class CategoryModel {
  String id, name, image;
  String deal;
  CategoryModel(this.id, this.name, this.image);

  CategoryModel.Deals(this.id, this.name, this.image, this.deal);

  static List<CategoryModel> fetchAllDeals() {
    return [
      CategoryModel.Deals(
        "1",
        "Vegetables",
        "assets/images/category/carrot.png",
        "60%",
      ),
      CategoryModel.Deals(
        "2",
        "Bread",
        "assets/images/category/bread.png",
        "30%",
      ),
      CategoryModel.Deals(
        "3",
        "Fruits",
        "assets/images/category/cherries.png",
        "28%",
      ),
      CategoryModel.Deals(
        "4",
        "Cheese",
        "assets/images/category/cheese.png",
        "26%",
      ),
    ];
  }

  static List<CategoryModel> fetchAll() {
    return [
      CategoryModel('1', 'Vegetable', 'assets/images/category/carrot.png'),
      CategoryModel('2', 'Bread', 'assets/images/category/bread.png'),
      CategoryModel('3', 'Fruits', 'assets/images/category/cherries.png'),
      CategoryModel('4', 'Cheese', 'assets/images/category/cheese.png'),
      CategoryModel('5', 'Vegetable', 'assets/images/category/carrot.png'),
      CategoryModel('6', 'Bread', 'assets/images/category/bread.png'),
      CategoryModel('7', 'Fruits', 'assets/images/category/cherries.png'),
      CategoryModel('8', 'Cheese', 'assets/images/category/cheese.png'),
      CategoryModel('9', 'Vegetable', 'assets/images/category/carrot.png'),
      CategoryModel('10', 'Bread', 'assets/images/category/bread.png'),
      CategoryModel('11', 'Fruits', 'assets/images/category/cherries.png'),
      CategoryModel('12', 'Cheese', 'assets/images/category/cheese.png'),
      CategoryModel('13', 'Vegetable', 'assets/images/category/carrot.png'),
      CategoryModel('14', 'Bread', 'assets/images/category/bread.png'),
      CategoryModel('15', 'Fruits', 'assets/images/category/cherries.png'),
      CategoryModel('16', 'Cheese', 'assets/images/category/cheese.png'),
      CategoryModel('17', 'Vegetable', 'assets/images/category/carrot.png'),
      CategoryModel('18', 'Bread', 'assets/images/category/bread.png'),
      CategoryModel('19', 'Fruits', 'assets/images/category/cherries.png'),
      CategoryModel('20', 'Cheese', 'assets/images/category/cheese.png'),
      CategoryModel('21', 'Vegetable', 'assets/images/category/carrot.png'),
      CategoryModel('22', 'Bread', 'assets/images/category/bread.png'),
      CategoryModel('23', 'Fruits', 'assets/images/category/cherries.png'),
      CategoryModel('24', 'Cheese', 'assets/images/category/cheese.png'),
      CategoryModel('25', 'Vegetable', 'assets/images/category/carrot.png'),
    ];
  }
}
