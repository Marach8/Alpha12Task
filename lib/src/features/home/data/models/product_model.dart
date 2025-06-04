class ProductsModel{

  ProductsModel({
    required this.productsId,
    this.products,
    this.productsGroupName
  });

  final String productsId;
  final String? productsGroupName;
  final List<Product>? products;
}


class Product{
  Product({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    this.about,
    this.isFavourite = false,
    this.productQuantity = 1,
    this.isInStock = true,
    this.isInCart = false,
  });

  final String id;
  final String image, description;
  final List<String?>? about;
  final double price;
  final bool isInStock;
  bool isFavourite, isInCart;
  int productQuantity;
}

