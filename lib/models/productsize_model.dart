class ProductSize {
  String qty;
  String size;
  String sizeVal;

  ProductSize(this.qty, this.size, this.sizeVal);

  static List<ProductSize> fetchAll() {
    return [
      ProductSize("1", "Kilogram", "KG"),
      ProductSize("200", "Gram", "G"),
      ProductSize("1", "Litre", "LTR"),
    ];
  }
}
