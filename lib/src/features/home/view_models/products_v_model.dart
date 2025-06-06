import '../../../global_export.dart';

final StateNotifierProvider<ProductsNotifier, A12ApiState<ProductsModel>>
  productsProvider = StateNotifierProvider<ProductsNotifier, A12ApiState<ProductsModel>>(
    (Ref ref) => ProductsNotifier(ref)
  );

class ProductsNotifier extends StateNotifier<A12ApiState<ProductsModel>> {
  ProductsNotifier(this.ref) : super(A12ApiState<ProductsModel>.initial());

  final Ref ref;

  Future<void> fetchProducts() async {
    state = A12ApiState<ProductsModel>.loading();

    try {
      //Simulate a network call
      await Future<void>.delayed(const Duration(seconds: 2));

      final List<Product> products = <Product>[
        Product(
          id: '1',
          image: A12ImgStrings.IPHONE,
          description: 'Apple iPhone 16 128GB|Teal',
          price: 700.00,
          about: <String>[
            'The pre-owned product is not apple certified but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
            "There will be no visible cosmetic imperfections when held at an arm's length"
          ]
        ),
        Product(
          id: '2',
          image: A12ImgStrings.MACBOOK,
          description: 'M4 Macbook Air 13" 256GB|Sky blue',
          price: 1000.00,
          about: <String>[
            'The pre-owned product is not apple certified but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
            "There will be no visible cosmetic imperfections when held at an arm's length"
          ]
        ),
        Product(
          id: '3',
          image: A12ImgStrings.GOOGLE_PIXEL,
          description: 'Google Pixel 9A 128GB|Iris',
          price: 499.00,
          about: <String>[
            'The pre-owned product is not apple certified but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
            "There will be no visible cosmetic imperfections when held at an arm's length"
          ]
        ),
        Product(
          id: '4',
          image: A12ImgStrings.EARPOD,
          description: 'Apple Airpods 4 Active Noise Cancellation',
          price: 129.00,
          about: <String>[
            'The pre-owned product is not apple certified but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
            "There will be no visible cosmetic imperfections when held at an arm's length"
          ]
        ),
        Product(
          id: '5',
          image: A12ImgStrings.IPHONE,
          description: 'Apple iPhone 16 128GB|Teal',
          price: 500.00,
          about: <String>[
            'The pre-owned product is not apple certified but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
            "There will be no visible cosmetic imperfections when held at an arm's length"
          ]
        ),
        Product(
          id: '6',
          image: A12ImgStrings.IPHONE,
          description: 'Apple iPhone 16 128GB|Teal',
          price: 850.00,
          about: <String>[
            'The pre-owned product is not apple certified but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
            "There will be no visible cosmetic imperfections when held at an arm's length"
          ]
        ),
      ];

      final ProductsModel model = ProductsModel(
        productsId: '10',
        products: products,
        productsGroupName: 'Smartphones, Laptops & Accessories',
      );

      state = A12ApiState<ProductsModel>.success(model,);
    } catch (e) {
      state = A12ApiState<ProductsModel>.failure(e.toString());
    }
  }
}
