import 'package:main_grocery/models/productprice_model.dart';
import 'package:main_grocery/models/productsize_model.dart';

class OrderModal {
  String productId;
  String productName;
  String productImage;
  ProductPrice productPrice;
  ProductSize productSize;
  int qty;

  OrderModal(this.productId, this.productName, this.productImage,
      this.productPrice, this.productSize, this.qty);

  static List<OrderModal> fetchAll() {
    return [
      OrderModal(
          "001",
          "Strawberry",
          "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
          ProductPrice("240", "₹"),
          ProductSize("01", "Kilogram", "KG"),
          1),
      OrderModal(
          "002",
          "Grapes",
          "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
          ProductPrice("40", "₹"),
          ProductSize("500", "Gram", "GRAM"),
          1),
      OrderModal(
          "003",
          "Banana",
          "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
          ProductPrice("35", "₹"),
          ProductSize("01", "Dozen", "DOZEN"),
          1),
      OrderModal(
          "004",
          "Strawberry",
          "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
          ProductPrice("240", "₹"),
          ProductSize("01", "Kilogram", "KG"),
          1),
      OrderModal(
          "005",
          "Grapes",
          "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
          ProductPrice("40", "₹"),
          ProductSize("500", "Gram", "GRAM"),
          1),
      OrderModal(
          "006",
          "Banana",
          "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
          ProductPrice("35", "₹"),
          ProductSize("01", "Dozen", "DOZEN"),
          1),
      OrderModal(
          "007",
          "Strawberry",
          "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
          ProductPrice("240", "₹"),
          ProductSize("01", "Kilogram", "KG"),
          1),
      OrderModal(
          "008",
          "Grapes",
          "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
          ProductPrice("40", "₹"),
          ProductSize("500", "Gram", "GRAM"),
          1),
      OrderModal(
          "009",
          "Banana",
          "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
          ProductPrice("35", "₹"),
          ProductSize("01", "Dozen", "DOZEN"),
          1),
    ];
  }
}
