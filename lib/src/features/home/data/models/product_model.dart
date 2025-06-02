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
    this.description,
    this.image,
    this.price,
    this.about,
    this.isFavourite = false,
    this.productQuantity = 1,
    required this.isInStock
  });

  final String id;
  final String? image, description;
  final List<String?>? about;
  final double? price;
  final bool isInStock;
  bool isFavourite;
  int productQuantity;
}

