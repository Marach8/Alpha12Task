import '../../../global_export.dart';

final StateNotifierProvider<ProductsNotifier, AsyncValue<ProductsModel?>>
  productsProvider = StateNotifierProvider<ProductsNotifier, AsyncValue<ProductsModel?>>(
    (Ref ref) => ProductsNotifier(ref)
  );

class ProductsNotifier extends StateNotifier<AsyncValue<ProductsModel?>>{
  ProductsNotifier(this.ref): super(const AsyncData<ProductsModel?>(null));

  final Ref ref;

  Future<void> fetchProducts()async{
    state = const AsyncLoading<ProductsModel?>();
    try{
      //Fake an API call
      await Future<void>.delayed(const Duration(seconds: 60));
      
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

      state = AsyncData<ProductsModel?>(
        ProductsModel(
          productsId: '10', products: products,
          productsGroupName: 'Smartphones, Laptops & Accessories'
        )
      );
    }
    catch (e){
      state = AsyncError<ProductsModel?>(e.toString(), StackTrace.current);
    }
  }
}