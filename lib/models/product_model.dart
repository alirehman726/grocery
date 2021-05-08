import 'package:main_grocery/models/productprice_model.dart';
import 'package:main_grocery/models/productsize_model.dart';

class ProductModel {
  static const tblProduct = 'Product';
  static const colId = 'id';
  static const colName = 'name';
  static const colSizes = 'sizes';
  static const colPrices = 'prices';
  static const colDescription = 'description';
  static const colImage = 'image';
  static const colBgColor = 'bgColor';
  static const colFavorite = 'Favorite';

  int id;
  String name;
  List<ProductSize> sizes;
  List<ProductPrice> prices;
  String description;
  List<String> image;
  String bgColor;
  int favorite;

  // static var Product;

  ProductModel(this.id, this.name, this.sizes, this.prices, this.description,
      this.image, this.bgColor, this.favorite);

  //
  //  ==================FORM_MAP============//
  //
  ProductModel.fromMap(Map<String, dynamic> map) {
    // Convert String into Array for Each ProductSize
    String strSizes = map[colSizes];
    var productSize = strSizes.split("|");
    // ignore: deprecated_member_use
    List<ProductSize> _productSizes = List<ProductSize>();
    for (var i = 0; i < productSize.length - 1; i++) {
      String size = productSize[i];
      var sizeItem = size.split("/");
      ProductSize proSize = new ProductSize(sizeItem[0].trim().toString(),
          sizeItem[1].trim().toString(), sizeItem[2].trim().toString());
      _productSizes.add(proSize);
      // print(_productSizes);
    }

    //Convert String into Array for Each ProductPrice
    String strPrice = map[colPrices];
    var productPrice = strPrice.split("|");
    // ignore: deprecated_member_use
    List<ProductPrice> _productPrices = List<ProductPrice>();
    for (var i = 0; i < productPrice.length - 1; i++) {
      String price = productPrice[i];
      var pricesize = price.split("/");
      ProductPrice proPrice = new ProductPrice(
          pricesize[0].trim().toString(), pricesize[1].trim().toString());
      _productPrices.add(proPrice);
      // print(_productPrices);
    }
    //Convert String into Array for Each ProductImage
    String strImage = map[colImage];
    var productImage = strImage.split("|");
    // ignore: deprecated_member_use
    List<String> _productImages = List<String>();
    for (var i = 0; i < productImage.length; i++) {
      String image = productImage[i];
      var imagesize = image.split("/");
      String proImage = imagesize[0].trim().toString();
      _productImages.add(proImage);
      // print(_productImages);
    }
    //
    //Conver Intager into boolean Each Favorite
    // int boolFav;
    // bool b1 = (boolFav == 0) ? false : true;
    // print(b1);
    //
    //
    //form_Map
    id = map[colId];
    name = map[colName];
    sizes = _productSizes;
    prices = _productPrices; //map[colPrices];
    description = map[colDescription];
    image = _productImages; //map[colImage];
    bgColor = map[colBgColor];
    favorite = map[colFavorite];
  }

  //
  //  ==================TO_MAP============//
  //

  Map<String, dynamic> toMap() {
    // =============== ProductSize=================//
    int i;
    ProductSize size;
    String strval = "";
    for (i = 0; i < sizes.length; i++) {
      size = sizes[i];
      strval += size.qty + " / " + size.size + " / " + size.sizeVal + " | ";
    }
    // print(strval);

    //===============Product_Price===============//
    ProductPrice price;
    String strprice = "";
    for (i = 0; i < prices.length; i++) {
      price = prices[i];
      strprice += price.price + " / " + price.symbol + " | ";
    }
    // print(strprice);

    //===============Image_Price===============//
    String images;
    String strimage = "";
    for (var i = 0; i < image.length; i++) {
      images = image[i];
      strimage += images + " | ";
    }
    // print(strimage);
    //

    var map = <String, dynamic>{
      colName: name,
      colSizes: strval,
      colPrices: strprice,
      colDescription: description,
      colImage: strimage,
      colBgColor: bgColor,
      colFavorite: favorite,
    };
    if (id != null) map[colId] = id;
    return map;
  }

  static List<ProductModel> fetchAll() {
    return [
      //
      //
      //
      //1
      //1
      ProductModel(
          1,
          "Strawberry1",
          [
            ProductSize("01", "Kilogram", "KG"),
            ProductSize("05", "Kilogram", "KG"),
          ],
          [
            ProductPrice("50", "₹"),
            ProductPrice("240", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-png-transparent-images-png-only-17.png"
          ],
          "FFEFF2",
          0),
      //2
      ProductModel(
          2,
          "Grapes2",
          [
            ProductSize("500", "Gram", "GRAM"),
            ProductSize("01", "Kilogram", "KG"),
          ],
          [
            ProductPrice("40", "₹"),
            ProductPrice("75", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            // "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c14a.png",
            // "https://lh3.googleusercontent.com/proxy/mHE1VZ-kF8b9U9na2Y4SHBfXz8Lx9cWrz1nJInNf_Y9NzBuq3A57tmtyjcsFRmc5Z0yTYhohuujkpHSb2pssx4211x1dF2joH4XT41ahlB8HKX3kC1p9oz5pTDf2h73t"
          ],
          "F3EBFF",
          0),
      //3
      ProductModel(
          3,
          "Banana3",
          [
            ProductSize("01", "Dozen", "DOZEN"),
            ProductSize("02", "Dozen", "DOGEN"),
          ],
          [
            ProductPrice("35", "₹"),
            ProductPrice("68", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
            // "https://webstockreview.net/images/banana-clipart-transparent-background-2.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png"
          ],
          "FFFBE6",
          0),

      //
      //
      //
      //
      //2
      //1
      ProductModel(
          4,
          "Strawberry4",
          [
            ProductSize("01", "Kilogram", "KG"),
            ProductSize("05", "Kilogram", "KG"),
          ],
          [
            ProductPrice("50", "₹"),
            ProductPrice("240", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-png-transparent-images-png-only-17.png"
          ],
          "FFEFF2",
          0),
      //2
      ProductModel(
          5,
          "Grapes5",
          [
            ProductSize("500", "Gram", "GRAM"),
            ProductSize("01", "Kilogram", "KG"),
          ],
          [
            ProductPrice("40", "₹"),
            ProductPrice("75", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            // "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c14a.png",
            // "https://lh3.googleusercontent.com/proxy/mHE1VZ-kF8b9U9na2Y4SHBfXz8Lx9cWrz1nJInNf_Y9NzBuq3A57tmtyjcsFRmc5Z0yTYhohuujkpHSb2pssx4211x1dF2joH4XT41ahlB8HKX3kC1p9oz5pTDf2h73t"
          ],
          "F3EBFF",
          0),
      //3
      ProductModel(
          6,
          "Banana6",
          [
            ProductSize("01", "Dozen", "DOZEN"),
            ProductSize("02", "Dozen", "DOGEN"),
          ],
          [
            ProductPrice("35", "₹"),
            ProductPrice("68", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
            // "https://webstockreview.net/images/banana-clipart-transparent-background-2.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png"
          ],
          "FFFBE6",
          0),

      //
      //
      //
      //
      //
      //3
      //1
      ProductModel(
          7,
          "Strawberry7",
          [
            ProductSize("01", "Kilogram", "KG"),
            ProductSize("05", "Kilogram", "KG"),
          ],
          [
            ProductPrice("50", "₹"),
            ProductPrice("240", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-png-transparent-images-png-only-17.png"
          ],
          "FFEFF2",
          0),
      //2
      ProductModel(
          8,
          "Grapes8",
          [
            ProductSize("500", "Gram", "GRAM"),
            ProductSize("01", "Kilogram", "KG"),
          ],
          [
            ProductPrice("40", "₹"),
            ProductPrice("75", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            // "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c14a.png",
            // "https://lh3.googleusercontent.com/proxy/mHE1VZ-kF8b9U9na2Y4SHBfXz8Lx9cWrz1nJInNf_Y9NzBuq3A57tmtyjcsFRmc5Z0yTYhohuujkpHSb2pssx4211x1dF2joH4XT41ahlB8HKX3kC1p9oz5pTDf2h73t"
          ],
          "F3EBFF",
          0),
      //3
      ProductModel(
          9,
          "Banana9",
          [
            ProductSize("01", "Dozen", "DOZEN"),
            ProductSize("02", "Dozen", "DOGEN"),
          ],
          [
            ProductPrice("35", "₹"),
            ProductPrice("68", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
            // "https://webstockreview.net/images/banana-clipart-transparent-background-2.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png"
          ],
          "FFFBE6",
          0),

      //
      //
      //
      //
      //
      //4
      //1
      ProductModel(
          10,
          "Strawberry10",
          [
            ProductSize("01", "Kilogram", "KG"),
            ProductSize("05", "Kilogram", "KG"),
          ],
          [
            ProductPrice("50", "₹"),
            ProductPrice("240", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-png-transparent-images-png-only-17.png"
          ],
          "FFEFF2",
          0),
      //2
      ProductModel(
          11,
          "Grapes11",
          [
            ProductSize("500", "Gram", "GRAM"),
            ProductSize("01", "Kilogram", "KG"),
          ],
          [
            ProductPrice("40", "₹"),
            ProductPrice("75", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            // "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c14a.png",
            // "https://lh3.googleusercontent.com/proxy/mHE1VZ-kF8b9U9na2Y4SHBfXz8Lx9cWrz1nJInNf_Y9NzBuq3A57tmtyjcsFRmc5Z0yTYhohuujkpHSb2pssx4211x1dF2joH4XT41ahlB8HKX3kC1p9oz5pTDf2h73t"
          ],
          "F3EBFF",
          0),
      //3
      ProductModel(
          12,
          "Banana12",
          [
            ProductSize("01", "Dozen", "DOZEN"),
            ProductSize("02", "Dozen", "DOGEN"),
          ],
          [
            ProductPrice("35", "₹"),
            ProductPrice("68", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
            // "https://webstockreview.net/images/banana-clipart-transparent-background-2.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png"
          ],
          "FFFBE6",
          0),

      //
      //
      //
      //
      //
      //5
      //1
      ProductModel(
          13,
          "Strawberry13",
          [
            ProductSize("01", "Kilogram", "KG"),
            ProductSize("05", "Kilogram", "KG"),
          ],
          [
            ProductPrice("50", "₹"),
            ProductPrice("240", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-png-transparent-images-png-only-17.png"
          ],
          "FFEFF2",
          0),
      //2
      ProductModel(
          14,
          "Grapes14",
          [
            ProductSize("500", "Gram", "GRAM"),
            ProductSize("01", "Kilogram", "KG"),
          ],
          [
            ProductPrice("40", "₹"),
            ProductPrice("75", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            // "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c14a.png",
            // "https://lh3.googleusercontent.com/proxy/mHE1VZ-kF8b9U9na2Y4SHBfXz8Lx9cWrz1nJInNf_Y9NzBuq3A57tmtyjcsFRmc5Z0yTYhohuujkpHSb2pssx4211x1dF2joH4XT41ahlB8HKX3kC1p9oz5pTDf2h73t"
          ],
          "F3EBFF",
          0),
    ];
  }

  static List<ProductModel> fetchDeals() {
    return [
      //
      //
      //
      //1
      ProductModel(
          1,
          "Strawberry",
          [
            ProductSize("01", "Kilogram", "KG"),
            ProductSize("05", "Kilogram", "KG"),
          ],
          [
            ProductPrice("50", "₹"),
            ProductPrice("240", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-png-transparent-images-png-only-17.png"
          ],
          "FFEFF2",
          0),
      //
      //
      //
      //
      //
      //2
      ProductModel(
          2,
          "Grapes",
          [
            ProductSize("500", "Gram", "GRAM"),
            ProductSize("01", "Kilogram", "KG"),
          ],
          [
            ProductPrice("40", "₹"),
            ProductPrice("75", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            // "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c14a.png",
            // "https://lh3.googleusercontent.com/proxy/mHE1VZ-kF8b9U9na2Y4SHBfXz8Lx9cWrz1nJInNf_Y9NzBuq3A57tmtyjcsFRmc5Z0yTYhohuujkpHSb2pssx4211x1dF2joH4XT41ahlB8HKX3kC1p9oz5pTDf2h73t"
          ],
          "F3EBFF",
          0),

      //
      //
      //
      //
      //
      //3
      ProductModel(
          3,
          "Banana",
          [
            ProductSize("01", "Dozen", "DOZEN"),
            ProductSize("02", "Dozen", "DOGEN"),
          ],
          [
            ProductPrice("35", "₹"),
            ProductPrice("68", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            "assets/images/Product/bananas.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png",
            // "https://webstockreview.net/images/banana-clipart-transparent-background-2.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c132.png"
          ],
          "FFFBE6",
          0),

      //
      //
      //
      //
      //
      //4
      ProductModel(
          4,
          "Strawberry",
          [
            ProductSize("01", "Kilogram", "KG"),
            ProductSize("05", "Kilogram", "KG"),
          ],
          [
            ProductPrice("50", "₹"),
            ProductPrice("240", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            "assets/images/Product/strawberry.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c1a0.png",
            // "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-png-transparent-images-png-only-17.png"
          ],
          "FFEFF2",
          0),

      //
      //
      //
      //
      //5
      ProductModel(
          5,
          "Grapes",
          [
            ProductSize("500", "Gram", "GRAM"),
            ProductSize("01", "Kilogram", "KG"),
          ],
          [
            ProductPrice("40", "₹"),
            ProductPrice("75", "₹"),
          ],
          "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit. <i>Phasellus lacinia</i> et purus at consequat. Curabitur sed lectus a est ornare feugiat nec sit amet orci. <strong>Vivamus</strong> tincidunt elementum lectus eget maximus. Nunc aliquam est vitae risus suscipit posuere. Aliquam erat volutpat. Praesent eget feugiat ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce facilisis, lectus eu sodales egestas, purus neque venenatis arcu, at egestas libero ipsum vel massa. Fusce vel varius lectus. In id elit blandit, commodo ex id, dictum turpis. Integer non metus neque. Quisque ante dolor, viverra non enim non, imperdiet commodo orci. Maecenas imperdiet ipsum eu dignissim posuere. Donec quis mi velit. Aenean in nulla augue.<br><br>Sed volutpat est felis, vitae interdum libero facilisis sed. Duis vestibulum metus in augue commodo rutrum. Nam dui dui, dictum a elementum ac, venenatis vitae lectus. Donec eget venenatis nisl. Nulla fringilla enim eget sapien consequat, ut vestibulum urna eleifend. Duis quis viverra purus, ut tempus neque. Fusce sodales lectus in mauris fermentum porta. Sed vitae ex vel justo egestas pretium. Praesent venenatis orci a faucibus porta. Praesent in mollis purus. Vestibulum scelerisque massa ligula, et maximus justo placerat vel. Morbi viverra ligula ac tempor cursus. Phasellus fermentum nisl quis libero pellentesque, at dapibus ligula efficitur. Vestibulum massa diam, efficitur eget dui ac, condimentum semper nibh. Aenean lacinia tempor eros. Ut ut est erat.<br><br>\tMaecenas hendrerit consectetur lorem in fringilla. In tincidunt odio quis risus accumsan ultrices. Nulla ut massa enim. Nulla tempus dui vitae ante sollicitudin bibendum. Nullam a pharetra felis. Maecenas vehicula tellus non dolor efficitur, vitae finibus nulla viverra. Sed iaculis, lectus eget fermentum dapibus, neque enim faucibus dolor, at posuere turpis nulla ac erat. Nulla mollis eget ipsum accumsan tempor. Donec sed metus pharetra, gravida lorem eu, consequat ex. Pellentesque ultricies diam efficitur velit auctor imperdiet.",
          [
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            "assets/images/Product/grapes.png",
            // "https://www.freepnglogos.com/uploads/grapes-png/grapes-dimidwa-12.png",
            // "https://assets.stickpng.com/images/580b57fcd9996e24bc43c14a.png",
            // "https://lh3.googleusercontent.com/proxy/mHE1VZ-kF8b9U9na2Y4SHBfXz8Lx9cWrz1nJInNf_Y9NzBuq3A57tmtyjcsFRmc5Z0yTYhohuujkpHSb2pssx4211x1dF2joH4XT41ahlB8HKX3kC1p9oz5pTDf2h73t"
          ],
          "F3EBFF",
          0),
    ];
  }
}
